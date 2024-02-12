//
//  DrawingView.swift
//  MuseMe
//
//  Created by Matthew Fails on 2/9/24.
//

import SwiftUI

struct Line {
//    
//    init() {
//        points = []
//        
//        lineWidth = 1.0
//    }
    
    var points: [CGPoint] = []
    var color: Color = .red
    var lineWidth: Double = 1.0
    
}

// DrawingView implementation
struct DrawingView: View {
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .red
    @State private var thickness: Double = 0.0
    var body: some View {
        Canvas { context, size in
            
            for line in lines {
                var path = Path()
                path.addLines(line.points)
                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
            }
                   
        }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged({ value in
                let newPoint = value.location
                currentLine.points.append(newPoint)
                lines.append(currentLine)
            })
                .onEnded({ value in
//                    self.lines.append(currentLine)
                    currentLine = Line(points: [], color: selectedColor, lineWidth: thickness)
                    
                })
               )
        
        HStack{
            Slider(value: $thickness, in: 1...20) {
                Text("Thickness")
            }.frame(width: 200)
                .onChange(of: thickness) { selection, newThickness in currentLine.lineWidth = newThickness
                    
                }
            Divider()
            ColorPickerView(selectedColor: $selectedColor)
                        .onChange(of: selectedColor) { selection, newColor in
                            currentLine.color = newColor
        }
        
        
            }
               
                   .frame(minWidth: 400, minHeight: 400)
                   .padding()
    }
}

#Preview {
    DrawingView()
}
