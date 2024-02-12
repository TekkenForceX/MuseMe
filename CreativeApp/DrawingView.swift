//
//  DrawingView.swift
//  MuseMe
//
//  Created by Matthew Fails on 2/9/24.
//

import SwiftUI

// Definition of the Line struct
struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

// DrawingView implementation
struct DrawingView: View {
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .red
    @State private var thickness: Double = 5.0

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Draw Your Inspiration")
                        .font(.system(size: 30)).bold()
                        .foregroundColor(.white)
                        .padding(.top, 50)

                    Canvas { context, size in
                        for line in lines {
                            var path = Path()
                            path.addLines(line.points)
                            context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                        }
                    }
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged({ value in
                            let newPoint = value.location
                            currentLine.points.append(newPoint)
                            currentLine.color = selectedColor
                            currentLine.lineWidth = thickness
                            self.lines.append(currentLine)
                        })
                        .onEnded({ _ in
                            self.currentLine = Line(points: [], color: selectedColor, lineWidth: thickness)
                        })
                    )
                    .frame(minWidth: 380, minHeight: 380)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)

                    HStack {
                        Slider(value: $thickness, in: 1...20)
                            .frame(width: 200)

                        ColorPicker("", selection: $selectedColor)
                    }
                    .padding()
                }
                .padding(20) // Apply padding to the VStack
                .background(
                    Image("wavybg")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 3)
                )
            }
        }
    }
}

// Preview provider for DrawingView
struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
