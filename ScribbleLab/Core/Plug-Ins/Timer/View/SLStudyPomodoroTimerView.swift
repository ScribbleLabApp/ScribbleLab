//
//  SLStudyPomodoroTimerView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 15.10.23.
//

// TODO: Show the estimated finished time. e.g.
// 30 min Timer · currently 3.30pm
// so Time + timer value = 4pm

import SwiftUI

struct SLStudyPomodoroTimerView: View {
    @EnvironmentObject var pomodoroModel: PomodoroModel
    
    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader { proxy in
                    VStack(spacing: 15) {
                        // MARK: - Timer ring
                        ZStack {
                            // background
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                            
                            // shadow
                            Circle()
                                .stroke( LinearGradient(colors: [.red, .orange, .yellow], startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                                .blur(radius: 10)
                                .opacity(0.1)
                            
                            // ring
                            Circle()
                                .trim(from: 0, to: pomodoroModel.progress)
                                .stroke( LinearGradient(colors: [.red, .orange, .yellow], startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                            
                            // ring blur
                            Circle()
                                .trim(from: 0, to: pomodoroModel.progress)
                                .stroke( LinearGradient(colors: [.red, .orange, .yellow], startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                                .blur(radius: 10)
                            
                            // Timer string value
                            Text(pomodoroModel.timerStringValue)
                                .font(.system(size: 50, weight: .light))
                                .rotationEffect(.init(degrees: 90))
                                .animation(.none, value: pomodoroModel.progress)
                            
                            // Estimated end time
                            Text(pomodoroModel.getCurrentTime())
                        }
                        .padding(60)
                        .frame(height: proxy.size.width)
                        .rotationEffect(.init(degrees: -90))
                        .animation(.easeInOut, value: pomodoroModel.progress)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                        Button {
                            if pomodoroModel.isStarted {
                                pomodoroModel.stopTimer()
                                // MARK: Cancel all notifications
                                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                            } else {
                                pomodoroModel.addNewTimer = true
                            }
                        } label: {
                            Image(systemName: !pomodoroModel.isStarted ? "timer" : "stop.fill")
                                .font(.largeTitle.bold())
                                .foregroundStyle(.white)
                                .frame(width: 80, height: 80)
                                .background {
                                    Circle()
                                        .fill(Color.black)
                                }
                                .shadow(color: .black,radius: 10)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
            }
            .padding()
            .overlay {
                ZStack {
                    Color.black
                        .opacity(pomodoroModel.addNewTimer ? 0.25 : 0)
                        .onTapGesture {
                            pomodoroModel.hour = 0
                            pomodoroModel.minutes = 0
                            pomodoroModel.seconds = 0
                            
                            pomodoroModel.addNewTimer = false
                        }
                    
                    newTimerView()
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: pomodoroModel.addNewTimer ? 0 : 400)
                }
                .animation(.easeInOut, value: pomodoroModel.addNewTimer)
            }
            .onReceive(Timer.publish(every: 1, on: .current, in: .common).autoconnect()) { _ in
                if pomodoroModel.isStarted {
                    pomodoroModel.upadateTimer()
                }
            }
            .alert("Your Study session is finished! 🎉", isPresented: $pomodoroModel.isFinished) {
                Button(role: .destructive) {
                    pomodoroModel.stopTimer()
                } label: {
                    Text("Close")
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                }
                
                Button("Start new", role: .cancel) {
                    pomodoroModel.stopTimer()
                    pomodoroModel.addNewTimer = true
                }

            }
            .navigationTitle("Pomodoro Timer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: New Timer Bottom Sheet
    @ViewBuilder
    func newTimerView() -> some View {
        VStack(spacing: 15) {
            Text("Add New Timer")
                .font(.title2.bold())
                .foregroundStyle(.black)
                .padding(.top, 10)
            
            HStack(spacing: 15) {
                Text("\(pomodoroModel.hour) hr")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black.opacity(0.3))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
                    .contextMenu {
                        ContextMenuOptions(maxValue: 12, hint: "hr") { value in
                            pomodoroModel.hour = value
                        }
                    }
                
                Text("\(pomodoroModel.minutes) min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black.opacity(0.3))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
                    .contextMenu {
                        ContextMenuOptions(maxValue: 60, hint: "min") { value in
                            pomodoroModel.minutes = value
                        }
                    }
                
                Text("\(pomodoroModel.seconds) sec")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black.opacity(0.3))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
                    .contextMenu {
                        ContextMenuOptions(maxValue: 60, hint: "sec") { value in
                            pomodoroModel.seconds = value
                        }
                    }
            }
            .padding(.top, 20)
            
            Button {
                pomodoroModel.startTimer()
            } label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 100)
                    .padding(.vertical)
                    .background {
                        Capsule()
                            .foregroundStyle(.black)
                    }
            }
            .disabled(pomodoroModel.seconds == 0)
            .opacity(pomodoroModel.seconds == 0 ? 0.5 : 1)
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white)
                .ignoresSafeArea()
        }
    }
    
    // MARK: Reusable Context Menu Options
    // swiftlint:disable identifier_name
    // swiftlint:disable void_return
    // swiftlint:disable return_arrow_whitespace
    @ViewBuilder
    func ContextMenuOptions(maxValue: Int, hint: String, onClick: @escaping (Int)->()) -> some View {
        ForEach(0...maxValue, id: \.self) { value in
            Button("\(value) \(hint)") {
                onClick(value)
            }
        }
    }
    // swiftlint:enable identifier_name
    // swiftlint:enable void_return
    // swiftlint:enable return_arrow_whitespace
}

#Preview {
    SLStudyPomodoroTimerView()
        .environmentObject(PomodoroModel())
}
