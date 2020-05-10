//
//  Car.swift
//  SwifUI08
//
//  Created by hanwe on 2020/05/10.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct Car : Codable, Identifiable {
    var id:String
    var name:String
    
    var description:String
    var isHybrid:Bool
    
    var imageName:String
}
