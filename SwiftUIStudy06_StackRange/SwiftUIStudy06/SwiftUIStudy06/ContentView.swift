//
//  ContentView.swift
//  SwiftUIStudy06
//
//  Created by hanwe on 2020/05/05.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack(alignment: .trailing) {
                Text("This is some text")
                Text("This is some longer text")
                Text("This is some short")
            }
            HStack(alignment:.lastTextBaseline, spacing: 20) {
                Text("This is some text")
                    .font(.largeTitle)
                Text("This is some much longer text")
                    .font(.body)
                Text("This is some short")
                    .font(.headline)
            }
            VStack(alignment: .leading) { // 이곳의 .leading과
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width:120,height: 50)
                Rectangle()
                    .foregroundColor(.red)
                    .alignmentGuide(.leading, computeValue: {d in d.width / 3})// 이곳의 .leading이 반드시 일치해야한다.
                    .frame(width:200,height: 50)
                Rectangle()
                    .foregroundColor(.blue)
                    .alignmentGuide(.leading, computeValue: {d in d[HorizontalAlignment.trailing] + 20})
                    .frame(width:180,height: 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
