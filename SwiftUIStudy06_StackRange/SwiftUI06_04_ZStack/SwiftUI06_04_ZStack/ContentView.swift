//
//  ContentView.swift
//  SwiftUI06_04_ZStack
//
//  Created by hanwe on 2020/05/05.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack (alignment: .myAlignment){//ZStack : 기준점이 같은곳인듯
            Rectangle()//autolayout이랑 비슷하게 가는듯
                .foregroundColor(.red)
                .alignmentGuide(HorizontalAlignment.myAlignment)
                { d in d[.trailing]}
                .alignmentGuide(VerticalAlignment.myAlignment)
                { d in d[VerticalAlignment.bottom]}
                .frame(width:100, height: 100)
            Circle()
                .foregroundColor(.purple)
                .alignmentGuide(VerticalAlignment.myAlignment)
                { d in d[VerticalAlignment.top]}
                .alignmentGuide(HorizontalAlignment.myAlignment)
                { d in d[HorizontalAlignment.center]}
                .frame(width: 100, height:  100)
            Circle()
                .foregroundColor(.blue)
                .alignmentGuide(HorizontalAlignment.myAlignment)
                { d in d[.leading]}
                .alignmentGuide(VerticalAlignment.myAlignment)
                { d in d[.bottom]}
                .frame(width: 100, height: 100)
            
        }
    }
}

extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat
        { d[HorizontalAlignment.center] }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    enum MyVertical:AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat
        { d[VerticalAlignment.center] }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

extension Alignment {
    static let myAlignment = Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
