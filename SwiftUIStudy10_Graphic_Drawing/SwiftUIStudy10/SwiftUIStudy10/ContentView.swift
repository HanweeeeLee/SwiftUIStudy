//
//  ContentView.swift
//  SwiftUIStudy10
//
//  Created by hanwe on 2020/05/16.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let colors = Gradient(colors: [Color.red, Color.yellow, Color.green, Color.blue, Color.purple])
    
    var body: some View {
        ScrollView(.vertical ) {
            VStack {
//                Circle()
//                    .fill(Color.red)
//                    .frame(width:200,height: 200)
//                Capsule()
//                    .stroke(lineWidth: 10)
//                    .foregroundColor(.blue)
//                    .frame(width:200, height: 100)
//                RoundedRectangle(cornerRadius: CGFloat(20))
//                    .stroke(style: StrokeStyle(lineWidth: CGFloat(8), dash: [CGFloat(10)]))
//                    .frame(width:200, height: 100)
//                Ellipse()
//                    .stroke(style: StrokeStyle(
//                        lineWidth: 20,
//                        dash: [CGFloat(10),CGFloat(5),CGFloat(2)],
//                        dashPhase: CGFloat(10)
//                    ))
//                    .foregroundColor(.blue)
//                    .frame(width:250, height: 150)
//                Ellipse()
//                    .fill(Color.red)
//                    .overlay(Ellipse().stroke(Color.blue, lineWidth:10))
//                    .frame(width:250, height: 150)

                Path { path in
                    path.move(to: CGPoint(x: 10, y: 0))
                    path.addLine(to: CGPoint(x: 10, y: 350))
                    path.addLine(to: CGPoint(x: 300, y: 300))
                    path.closeSubpath()
                }
                .fill(Color.green)
                
                MyShape()
                    .fill(Color.red)
                    .frame(width:360, height: 350)
                
                Circle().fill(RadialGradient(gradient: colors,
                                             center: .center,
                                             startRadius: CGFloat(0),
                                             endRadius: CGFloat(300)
                ))
                    .frame(width:200, height: 200)
                Circle().fill(AngularGradient(gradient: colors, center: .center)).frame(width:200, height: 200)
                
                Rectangle()
                    .fill(LinearGradient(gradient: colors,
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width:360, height: 350)
                
                MyShape().fill(RadialGradient(gradient: colors,
                                              center: .center,
                                              startRadius: CGFloat(0),
                                              endRadius: CGFloat(300)))
                    .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing))
                    .frame(width: 360, height: 350)
                
            }
        }
//        .frame(width: 100,height:2000)
        
    }
}

struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
