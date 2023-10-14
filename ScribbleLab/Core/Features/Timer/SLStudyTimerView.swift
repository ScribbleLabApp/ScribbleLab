//
//  SLStudyTimerView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI
import UserNotifications

struct SLStudyTimerView: View {
    var body: some View {
        NavigationStack {
            VStack {
                TimerView()
            }
                .navigationTitle("Timer")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct TimerView: View {
    @State private var start = false
    @State private var to : CGFloat = 0.01
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
                            /// shows the time when the timer ends
                            ///
                            /// User: 11 am  ·   4 min timer
                            /// Text(endTime) // 11:04 am
                            // TODO: Access the users time zone and calculate time
                            Image(systemName: "bell.fill")
                            Text("09:30 am")
                        }
                    }
                }
            }
            
            HStack(spacing: 20) {
                Button {
                    if self.count == 60 { // 30
                        self.count = 0
                        
                        withAnimation(.default) {
                            self.to = 0
                        }
                    }
                    self.start.toggle()
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
                    .shadow(radius: 6)
                }
                
                Button {
                    self.count = 0
                    
                    withAnimation(.default) {
                        self.to = 0.01
                    }
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
                    .shadow(radius: 6)
                }
            }
            .padding(.top, 12)
        }
        .onAppear {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert, .criticalAlert]) { (_, _) in
                notifyWhenTimerEnds()
            }
        }
        // FIXME: Fix hardcoded value
        .onReceive(self.time) { (_) in
            if self.start {
                if self.count != 60 {
                    self.count += 1
                    print("tick")
                    
                    withAnimation(.default) {
                        self.to = CGFloat(self.count) / 60 // the number of counts will be divided by the ammount of sec
                    }
                } else {
//                    withAnimation(.default) {
//                        self.to = 0
//                    }
                    self.start.toggle()
                    self.notifyWhenTimerEnds()
                }
            }
        }
    }
    
    func notifyWhenTimerEnds() {
        // Configure the notification's payload.
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Study Timer", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Your study timer has expired.", arguments: nil)
        content.sound = UNNotificationSound.default
        
        // Deliver the notification in five seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger) // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            if error != nil {
                 // Handle any errors
             }
        }
        
    }
}

#Preview {
    SLStudyTimerView()
}
