//
//  DocumentScannerView.swift
//  ScribbleLab Core/Editor
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp. All rights reserved
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import SwiftUI

import VisionKit
import PDFKit

struct DocumentScannerView: UIViewControllerRepresentable {
    @Binding var scannedPDFURL: URL?

    class Coordinator: NSObject, UINavigationControllerDelegate, VNDocumentCameraViewControllerDelegate {
        var parent: DocumentScannerView

        init(parent: DocumentScannerView) {
            self.parent = parent
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            // Process the scanned pages
            parent.processScannedPages(scan)
        }

        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            // Handle cancellation
            parent.scannedPDFURL = nil
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            // Handle error
            parent.scannedPDFURL = nil
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.delegate = context.coordinator
        return documentCameraViewController
    }

    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        // Nothing to update
    }

    private func processScannedPages(_ scan: VNDocumentCameraScan) {
        let pdfDocument = PDFDocument()

        for pageIndex in 0 ..< scan.pageCount {
            let image = scan.imageOfPage(at: pageIndex)
            let pdfPage = PDFPage(image: image)
            pdfDocument.insert(pdfPage!, at: pageIndex)
        }

        // Save or use the created PDF document as needed
        // For example, save it to the app's documents directory
        scannedPDFURL = savePDFDocument(pdfDocument)
    }

    private func savePDFDocument(_ pdfDocument: PDFDocument) -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let pdfURL = documentsDirectory.appendingPathComponent("ScannedDocument.pdf")

        pdfDocument.write(to: pdfURL)
        return pdfURL
    }
}
