//
//  CarStore.swift
//  SwifUI08
//
//  Created by hanwe on 2020/05/10.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI
import Combine

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init(cars:[Car] = []) {
        self.cars = cars
    }
}
