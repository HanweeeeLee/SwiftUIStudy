//
//  HWData.swift
//  SwiftUIStudy03
//
//  Created by hanwe on 2020/05/03.
//  Copyright © 2020 hanwe. All rights reserved.
//

import UIKit
import Combine

class HWData: ObservableObject { // Environment 를 두개 넣을 수는 없나??
    
    @Published var myCount = 0
    
    init(myCount:Int) {
        // 데이터를 초기화하는 코드가 여기에 온다
        self.myCount = myCount
        updateData()
    }
    
    func updateData() {
        // 데이터를 최신 상태로 유지하기 위한 코드가 여기에 온다.
    }
}

