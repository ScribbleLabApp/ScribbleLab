//
//  DrawingTest.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 25.11.23.
//

import SwiftUI
import PencilKit

struct DrawingTest: View {
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    
    @State private var previousPoint: CGPoint = .zero
    @State private var previousStrength: CGFloat = 0.0
    
    @State private var selectedColor: Color = .red
    @State private var thickness: Double = 0.0
    
    @GestureState private var isDetectingPressure = false

    
    var body: some View {
        VStack {
            // swiftlint:disable unused_closure_parameter
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
                
                
            }
            // swiftlint:enable unused_closure_parameter
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
//                    let newPoint = value.location
//                    currentLine.points.append(newPoint)
//                    self.lines.append(currentLine)
                    let newPoint = value.location
                    let distance = hypot(newPoint.x - previousPoint.x, newPoint.y - previousPoint.y)
                    let strength = distance * 0.5
                    let smoothedStrength = (strength + previousStrength * 4) / 5 // Simple smoothing
                                        
                    currentLine.points.append(newPoint)
                    currentLine.lineWidth = isDetectingPressure ? max(smoothedStrength, 1.0) : 5.0
                                        
                    self.lines.append(currentLine)
                    previousPoint = newPoint
                    previousStrength = smoothedStrength
                })
                .updating($isDetectingPressure) { value, state, _ in
                    state = true // Update the flag to indicate pressure detection
                }
                .onEnded({ value in
                    self.currentLine = Line(points: [], color: selectedColor, lineWidth: thickness)
                })
            )
            HStack {
                
                Slider(value: $thickness, in: 1...20) {
                    Text("Thickness")
                }
                .frame(maxWidth: 200)
                .onChange(of: thickness) { newThickness in
                    currentLine.lineWidth = newThickness
                }
                
                Divider()
                    .frame(maxHeight: 50)
                
                ColorPickerView(selectedColor: $selectedColor)
                    .onChange(of: selectedColor) { newColor in
                        currentLine.color = newColor
                }
            }
        }
        .padding()
    }
}

#Preview {
    DrawingTest()
}
