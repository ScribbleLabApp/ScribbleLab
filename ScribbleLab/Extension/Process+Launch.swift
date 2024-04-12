//
//  Process+Launch.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 12.04.24.
//

import Foundation

#if os(macOS)
// swiftlint:disable identifier_name
extension Process {
    enum LaunchError: Swift.Error {
        case exit(Int32)
        case signal(Int32)
        case ioError(Int32)
        case invalidProcessState
        
        init?(terminationOf process: Process) {
            switch process.terminationReason {
            case .exit where process.terminationStatus != 0:
                self = .exit(process.terminationStatus)
            case .uncaughtSignal:
                self = .signal(process.terminationStatus)
            default:
                return nil
            }
        }
    }
    
    /// Launches process allowing interaction in async environment
    ///
    /// - Parameters:
    ///   - queue: A queue to be used for IO scheduling
    ///   - reportInterval: Maximum output report interval. if set, stdout and stderr streams will yield empty elements through given intervals even if no data available.
    ///   - build: a block to use for building interaction. As soon as your block returns, the process input stream is closed.
    /// - Returns: result of build operation
    /// # Example #
    /// simplified usage:
    /// ```
    /// let output: AsyncThrowingOutputStream<Data, any Error> = try await process.launch()
    /// ```
    /// extended usage:
    /// ```
    /// try await process.launch(reportInterval: .seconds(1)) { input, output, error in {
    ///     try await input(Data()) // write arbitraty data to process input
    ///     for try await data in output { /* ... */ } // read process output
    ///     for try await data in error { /* ... */ }  // read process error
    ///     // at this point, process input is closed. `output` and `error` streams, however, may escape.
    /// }
    /// ```
    func launch<R>(
        queue target: DispatchQueue? = nil,
        reportInterval: DispatchTimeInterval? = nil,
        build: (
            (Data) async throws -> Void,          // stdin
            AsyncThrowingStream<Data, any Error>, // stdout
            AsyncThrowingStream<Data, any Error>  // stderr
        ) async throws -> R = { _, o, _ in o }
    ) async throws -> R {
        let process: Process = self
        
        guard !process.isRunning && process.processIdentifier == 0 else { throw LaunchError.invalidProcessState }
        
        let group = DispatchGroup()
        let inputPipe = Pipe(), outputPipe = Pipe(), errorPipe = Pipe()
        let queue = DispatchQueue(label: "IO for \(process)", target: target)
        
        process.standardInput = inputPipe
        process.standardOutput = outputPipe
        
        group.enter()
        process.terminationHandler = { _ in
            group.leave()
        }
        
        group.enter()
        let stdinIO = DispatchIO(
            type: .stream,
            fileDescriptor: inputPipe.fileHandleForWriting.fileDescriptor,
            queue: queue
        ) { [inputPipe] _ in
            try? inputPipe.fileHandleForWriting.close()
            group.leave()
        }
        defer { stdinIO.close() }
        
        group.enter()
        let stdoutIO = DispatchIO(
            type: .stream,
            fileDescriptor: outputPipe.fileHandleForReading.fileDescriptor,
            queue: queue
        ) { _ in
            try! outputPipe.fileHandleForReading.close()
            group.leave()
        }
        if let reportInterval {
            stdoutIO.setInterval(interval: reportInterval, flags: [.strictInterval])
        }
        
        group.enter()
        let stderrIO = DispatchIO(
            type: .stream,
            fileDescriptor: errorPipe.fileHandleForReading.fileDescriptor,
            queue: queue
        ) { _ in
            try! errorPipe.fileHandleForReading.close()
            group.leave()
        }
        if let reportInterval {
            stderrIO.setInterval(interval: reportInterval, flags: [.strictInterval])
        }
        
        let input: (Data) async throws -> Void = { data in
            try await withCheckedThrowingContinuation { continuation in
                stdinIO.write(offset: 0, data: data.dispatchData, queue: queue) { isDone, _, error in
                    if error != 0 {
                        continuation.resume(throwing: LaunchError.ioError(error))
                    } else if isDone {
                        continuation.resume()
                    }
                }
            }
        }
        
        let output = AsyncThrowingStream<Data, any Swift.Error> { upstream in
            group.notify(queue: queue) {
                upstream.finish(throwing: LaunchError(terminationOf: process))
            }
            
            stdoutIO.read(offset: 0, length: .max, queue: .global()) { isDone, data, error in
                if let data {
                    upstream.yield(.init(dispatchData: data))
                }
                if error != 0 {
                    upstream.finish(throwing: LaunchError.ioError(error))
                }
                if isDone {
                    stdoutIO.close()
                }
            }
        }
        
        let error = AsyncThrowingStream<Data, any Swift.Error> { upstream in
            group.notify(queue: queue) {
                upstream.finish(throwing: LaunchError(terminationOf: process))
            }
            
            stderrIO.read(offset: 0, length: .max, queue: .global()) { isDone, data, error in
                if let data {
                    upstream.yield(.init(dispatchData: data))
                }
                if error != 0 {
                    upstream.finish(throwing: LaunchError.ioError(error))
                }
                if isDone {
                    stderrIO.close()
                }
            }
        }
        try process.run()
        
        return try await build(input, output, error)
    }
}

private extension Data {
    var dispatchData: DispatchData {
        self as NSObject as? DispatchData ?? self.withUnsafeBytes(DispatchData.init(bytes:))
    }
    
    init(dispatchData: DispatchData) {
        if let nsdata = dispatchData as NSObject as? NSData {
            self.init(referencing: nsdata)
        } else {
            self.init()
            for region in dispatchData.regions {
                self.append(contentsOf: region)
                region.withUnsafeBytes { buffer in
                    guard let ptr = buffer.baseAddress?.assumingMemoryBound(to: UInt8.self) else { return }
                    self.append(ptr, count: buffer.count)
                }
            }
        }
    }
}
// swiftlint:enable identifier_name
#endif
