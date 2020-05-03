//
//  SecondView.swift
//  SwiftUIStudy03
//
//  Created by hanwe on 2020/05/03.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var demoData : DemoData//unwrapped optionals 마냥 있다고 가정하는 데이터
    
    var body: some View {
        VStack {
            Text("hello world")
            Text("currentCount :\(demoData.userCount), user:\(demoData.currentUser)")
        }
        
    }
}

