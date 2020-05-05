//
//  SecondView.swift
//  SwiftUIStudy05
//
//  Created by hanwe on 2020/05/05.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct SecondView: View {
//    @ObservedObject var timerData: TimerData
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
//        SecondView(timerData: TimerData())
        SecondView().environmentObject(TimerData())
    }
}
