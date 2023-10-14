//
//  SLStudyTimerView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI

struct SLStudyTimerView: View {
    @State private var start = false
    @State private var to : CGFloat = 0
    @State private var count = 0
    @State private var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VStack {
                TimerView()
                
                TimerButtonView()
            }
                .navigationTitle("Timer")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct TimerView: View {
    @State private var start = false
    @State private var to : CGFloat = 0
    @State private var count = 0
    @State private var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
                ZStack {
                    Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    .frame(width: 280, height: 280)
                    
                    // progress view
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(LinearGradient(colors: [.yellow, . orange, .red, .pink], startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    .frame(width: 280, height: 280)
                    .rotationEffect(.init(degrees: -90))
                    
                    VStack {
                        /// Shows how much min your timer is done
                        Text("\(self.count)")
                            .font(.system(size: 65))
                            .fontWeight(.semibold)
                        HStack {
                            /// shows how much minutes the timer has
                            Image(systemName: "bell.fill")
                            Text("00:30")
                        }
                    }
                }
    //            .rotationEffect(.init(degrees: -90))
            }
            
//            HStack(spacing: 20) {
//                Button {
//                    start.toggle()
//                } label: {
//                    HStack(spacing: 15) {
//                        Image(systemName: self.start ? "pause.fill" : "play.fill")
//                            .foregroundStyle(self.start ? .red : .green)
//                        Text(self.start ? "Pause" : "Start")
//                            .foregroundStyle(self.start ? .red : .green)
//                    }
//                    .padding(.vertical)
//                    .frame(width: (UIScreen.main.bounds.width / 2) - 55)
//                    .background(
//                        Capsule()
//                            .stroke(self.start ? Color.red  : Color.green ,lineWidth: 2)
//                    )
//                }
//                
//                Button {
//                    
//                } label: {
//                    HStack(spacing: 15) {
//                        Image(systemName: "arrow.clockwise")
//                            .foregroundStyle(.black)
//                        Text("Restart")
//                            .foregroundStyle(.black)
//                    }
//                    .padding(.vertical)
//                    .frame(width: (UIScreen.main.bounds.width / 2) - 55)
//                    .background(
//                        Capsule()
//                            .stroke(Color.black, lineWidth: 2)
//                    )
//                }
//                
//            }
        }
        .onReceive(self.time) { (_) in
            print("tick")
        }
    }
}

struct TimerButtonView: View {
    @State private var start = false

    var body: some View {
        HStack(spacing: 20) {
            Button {
                start.toggle()
            } label: {
                HStack(spacing: 15) {
                    Image(systemName: self.start ? "pause.fill" : "play.fill")
                        .foregroundStyle(self.start ? .red : .green)
                    Text(self.start ? "Pause" : "Start")
                        .foregroundStyle(self.start ? .red : .green)
                }
                .padding(.vertical)
                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                .background(
                    Capsule()
                        .stroke(self.start ? Color.red  : Color.green ,lineWidth: 2)
                )
            }
            
            Button {
                
            } label: {
                HStack(spacing: 15) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundStyle(.black)
                    Text("Restart")
                        .foregroundStyle(.black)
                }
                .padding(.vertical)
                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                .background(
                    Capsule()
                        .stroke(Color.black, lineWidth: 2)
                )
            }
            
        }
    }
}

#Preview {
    SLStudyTimerView()
}
