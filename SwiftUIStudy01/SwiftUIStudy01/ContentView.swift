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
                    .modifier(StandardTitle())
                Text("Text2")
                    .modifier(StandardTitle())
                MyHStackView()
            }
            MyCarStackView().font(.largeTitle)
            VStack {
                Button(action: buttonPressed) {
                    Text("Click Me")
                    Image(systemName: "square.and.arrow.down")
                }
                .onDisappear {
                    print("버튼이 사라진다.")
                }
                .onAppear {
                    print("버튼이 나타났다.")
                }
            }
            
        }
    }
    
    func buttonPressed() {
        //동작할 코드가 온다.
    }
}

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("Text 3")
            Text("Text 4")
                .padding()
                .border(Color.black)
        }
    }
}

struct MyCarStackView: View {
    var body: some View {
        HStack {
            Text("car Image")
            Image(systemName: "car.fill")
            .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

/*
 custom container view
 자주쓰이는 VStack이지만 서로 다른 뷰들이 담겨야한다.
 */
struct MyVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}
/*
 custom container view end
*/

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
