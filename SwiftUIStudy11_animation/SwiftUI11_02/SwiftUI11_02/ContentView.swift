//
//  ContentView.swift
//  SwiftUI11_02
//
//  Created by hanwe on 2020/05/16.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isBUttonVisible:Bool = true
    
    var body: some View {
        VStack {
            Toggle(isOn:$isBUttonVisible.animation(
                .linear(duration: 2))) {
                    Text("Show/Hide Button")
            }
            .padding()
            
            if isBUttonVisible {
                Button(action: {}) {
                    Text("Example Button")
                }
                .font(.largeTitle)
                .transition(.slide)
//                .transition(.move(edge: .top))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
