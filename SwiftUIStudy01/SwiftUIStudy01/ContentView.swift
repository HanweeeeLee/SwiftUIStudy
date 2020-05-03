//
//  ContentView.swift
//  SwiftUIStudy01
//
//  Created by hanwe on 2020/05/03.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Text("Hello, World!")
//                .font(.largeTitle)
//                .foregroundColor(.red)
            VStack {
                Text("Text1")
                Text("Text2")
                MyHStackView()
            }
            HStack {
                Text("car Image")
                Image(systemName: "car.fill")
            }
            
        }
    }
}

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("Text 3")
            Text("Text 4")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
                .environment(\.colorScheme, .dark)
            
//            ContentView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                .previewDisplayName("iPhone 11")
        }
    }
}
