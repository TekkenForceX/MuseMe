//
//  DrawingView.swift
//  MuseMe
//
//  Created by Matthew Fails on 2/9/24.
//

import SwiftUI
import UIKit

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

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

                        Button("Save Drawing") {
                            saveDrawing()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    }
                    .padding()
                }
                .padding(20)
                .background(
                    Image("wavybg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: 1000)
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
    }

    func saveDrawing() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 380, height: 380))
        let image = renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor.white.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(CGFloat(thickness))
            
            let path = UIBezierPath()
            for line in lines {
                guard let firstPoint = line.points.first else { continue }
                path.move(to: firstPoint)
                line.points.forEach { path.addLine(to: $0) }
                ctx.cgContext.setStrokeColor(UIColor(line.color).cgColor)
                ctx.cgContext.setLineWidth(CGFloat(line.lineWidth))
                path.stroke()
            }
        }
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
