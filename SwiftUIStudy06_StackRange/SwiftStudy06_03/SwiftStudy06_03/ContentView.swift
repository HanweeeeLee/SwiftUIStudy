//
//  ContentView.swift
//  SwiftStudy06_03
//
//  Created by hanwe on 2020/05/05.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            HStack(alignment: .oneThird) {
//                Rectangle()
//                    .foregroundColor(.green)
//                    .frame(width:50, height:  200)
//                Rectangle()
//                    .foregroundColor(.blue)
//                    .alignmentGuide(.oneThird, computeValue: { d in d[VerticalAlignment.top]})
//                    .frame(width:50, height:  200)
//                Rectangle()
//                    .foregroundColor(.red)
//                    .frame(width:50, height:  200)
//                Rectangle()
//                    .foregroundColor(.orange)
//                    .alignmentGuide(.oneThird, computeValue: {d in d[VerticalAlignment.bottom]})
//                    .frame(width:50, height:  200)
//            }
            
            HStack(alignment: .crossAlignment, spacing: 20) {
                Circle()
                    .foregroundColor(.purple)
                    .alignmentGuide(.crossAlignment, computeValue: {d in d[VerticalAlignment.center]})
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .center) {
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 100, height: 100)
                    
                    Rectangle()
                        .foregroundColor(.blue)
                        .alignmentGuide(.crossAlignment, computeValue: {d in d[VerticalAlignment.center]})
                        .frame(width: 100, height: 100)
                    
                    Rectangle()
                        .foregroundColor(.orange)
                        .frame(width: 100, height: 100)
                    
                }
            }
        }
        
    }
}

extension VerticalAlignment {
    private enum OneThird : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}

extension VerticalAlignment {
    private enum CrossAlignmnet : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignmnet.self)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
