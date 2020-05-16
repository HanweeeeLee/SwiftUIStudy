//
//  ContentView.swift
//  SwiftUIStudy11
//
//  Created by hanwe on 2020/05/16.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var rotation:Double = 0
    @State private var scale:CGFloat = 1
    
    @State private var visibility = false
    @State private var isSpinning:Bool = true
    
    var body: some View {
        VStack {
            VStack {
                Button(action: { // 암묵적 애니메이션
                    self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
                    self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
                    
                }) {
                    Text("Click to animate")
                        .rotationEffect(.degrees(rotation))
                        //                .animation(.linear(duration: 1))
                        .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0))
                        .scaleEffect(scale)
                }
                //            Button(action : { withAnimation(.linear (duration : 2)) {//명시적 애니메이션
                //                self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
                //                }
                //                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
                //            }) {
                //                Text("Click to Animate")
                //                    .rotationEffect(.degrees(rotation))
                //                    .scaleEffect(scale)
                //            }
                Toggle(isOn: $visibility.animation(.linear(duration: 1))) {
                    Text("Toggle Text Views")
                }
                .padding()
                
                if visibility {
                    Text("Hello World")
                        .font(.largeTitle)
                }
                
                if !visibility {
                    Text("Goodbye World")
                        .font(.largeTitle)
                }
            }
            VStack {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.blue)
                        .frame(width: 360, height: 360)
                    
                    Image(systemName: "forward.fill")
                        .font(.largeTitle)
                        .offset(y: -180)
                        .rotationEffect(.degrees(isSpinning ? 0 : 360))
                        .animation(Animation.linear(duration: 5)
                        .repeatForever(autoreverses:false))
                }
                .onAppear() {
                    self.isSpinning.toggle()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
