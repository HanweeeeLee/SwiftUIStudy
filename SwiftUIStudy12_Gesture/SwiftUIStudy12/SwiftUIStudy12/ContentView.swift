//
//  ContentView.swift
//  SwiftUIStudy12
//
//  Created by hanwe on 2020/05/16.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var magnification:CGFloat = 1.0
    
    var body: some View {
//        let tap = TapGesture()
//            .onEnded { _ in
//                print("tapped")
//        }
//
//        return Image(systemName: "hand.point.right.fill")
//        .gesture(tap)
        
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged({ value in
//                print("Magnifying")
                self.magnification = value
            })
            .onEnded { _ in
                print("Gesture Ended")
        }
        
        return Image(systemName: "hand.point.right.fill")
            .resizable()
            .font(.largeTitle)
            .scaleEffect(magnification)
            .gesture(magnificationGesture)
            .frame(width: 100, height: 90)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
