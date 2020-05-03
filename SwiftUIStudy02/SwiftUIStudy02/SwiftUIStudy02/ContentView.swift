//
//  ContentView.swift
//  SwiftUIStudy02
//
//  Created by hanwe on 2020/05/03.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            financialView()
            Text("Hello World, How Are You?")
                .font(.largeTitle)
                .border(Color.black)
//                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 100, alignment: .center)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            //frame을 지정해줄 수 있다.
                .edgesIgnoringSafeArea(.all) // 이 옵션을 사용하게되면 safe area를 무시할 수 있다.
            myGroupView()
            myTestView()
            GeometryReader { geometry in // 컨테이너의 크기에 따라 조절됨.
                VStack {// 이 VStack의 크기에 따라 텍스트뷰의 크기를 결정
                    Text("Hello World, how are you")
                        .font(.largeTitle)
                        .frame(width: geometry.size.width / 2, height: (geometry.size.height / 4) * 3)
                    Text("Goodbye World")
                        .font(.largeTitle)
                        .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                }
            }
        }
    }
}

struct financialView: View { // 이런식으로 UI를 잡아줘야한다.
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Financial Results")
                .font(.title)
            HStack(alignment: .top) {
                Text("Q1 Sales")
                    .font(.headline)
                Spacer()
                VStack (alignment: .leading){
                    Text("January")
                    Text("February")
                    Text("March")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
                .padding(5)
            }
            .padding(5)
        }
        .padding(5)
    }
}

struct myTestView: View { //줄 수를 지정해 줄 수 있다.
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "airplane")
                Text("Flight times:")
                Text("London").layoutPriority(1) // "London"의 우선순위를 1로 주어서 "Flight times"은 ...으로 표기되어도 "London"은 가능하면 ...으로 표기되지 않게 하는 처리
            }
            .font(.largeTitle)
            .lineLimit(1) //반드시 한줄로. 보여줄 수 없다면 ...으로 표기
        }
    }
}

struct myGroupView: View { // 컨테니어의 자식뷰 제한으로 그룹으로 묶어서 처리해야한다.
    var body: some View {
        VStack {
            Group {
                Text("sample Text")
                Text("sample Text")
                Text("sample Text")
                Text("sample Text")
                Text("sample Text")
                Text("sample Text")
            }
            Group {
                Text("sample Text")
                Text("sample Text")
                Text("sample Text")
                Text("sample Text")
                Text("sample Text")
                Text("sample Text")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
