//
//  ContentView.swift
//  SwiftUIStudy04
//
//  Created by hanwe on 2020/05/05.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotation:Double = 0
    @State private var text:String = "Welcome to SwiftUI"
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black","Red","Green","Blue"]
    @State private var colorIndex = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(self.rotation))
                .animation(.easeInOut(duration: 5))
                .foregroundColor(self.colors[self.colorIndex])
            Spacer()//공간을 준다
            Divider()// 나누는 선
            Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                .padding()
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()//좌우 패딩인듯
            
            
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach (0 ..< colornames.count) {
                    Text(self.colornames[$0])
                        .foregroundColor(self.colors[$0])
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
