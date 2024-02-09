//
//  DrawingView.swift
//  MuseMe
//
//  Created by Matthew Fails on 2/9/24.
//

import SwiftUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct DrawingView: View {
    @State private var currentLine =  Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .red
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
                self.lines.append(currentLine)
            })
                .onEnded({ value in
//                    self.lines.append(currentLine)
                    self.currentLine = Line(points: [])
                    
                })
               )
        
        ColorPickerView(selectedColor: $selectedColor)
               
                   .frame(minWidth: 400, minHeight: 400)
    }
}

#Preview {
    DrawingView()
}
