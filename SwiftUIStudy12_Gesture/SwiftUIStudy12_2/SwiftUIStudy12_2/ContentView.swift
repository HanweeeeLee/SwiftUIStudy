//
//  ContentView.swift
//  SwiftUIStudy12_2
//
//  Created by hanwe on 2020/05/16.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var offset:CGSize = .zero
    @GestureState private var longPress:Bool = false
    
    var body: some View {
        
        let longPressAndDrag = LongPressGesture(minimumDuration: 1.0)
            .updating($longPress) { value, state, transition in
                state = value
        }
        .simultaneously(with: DragGesture())
        .updating($offset) { value, state, transaction in
            state = value.second?.translation ?? .zero
        }
        
        return Image(systemName: "hand.point.right.fill")
            .foregroundColor(longPress ? Color.red : Color.blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressAndDrag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
