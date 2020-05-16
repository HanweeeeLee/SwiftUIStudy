//
//  ContentView.swift
//  SwiftUIStudy09_2_Context_Menu_Binding
//
//  Created by hanwe on 2020/05/16.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var foregroundColor: Color = Color.black
    @State private var backgroundColor: Color = Color.white
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .padding()
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .contextMenu {// 롱프레스로 확인 할 수 있다.
                Button(action: {
                    self.foregroundColor = .black
                    self.backgroundColor = .white
                }) {
                    Text("Normal Colors")
                    Image(systemName: "paintbrush")
                }
                
                Button(action: {
                    self.foregroundColor = .white
                    self.backgroundColor = .black
                    
                }) {
                    Text("Inverted Colors")
                    Image(systemName: "paintbrush.fill")
                }
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
