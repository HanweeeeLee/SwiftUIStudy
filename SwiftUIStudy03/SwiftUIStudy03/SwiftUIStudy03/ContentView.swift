//
//  ContentView.swift
//  SwiftUIStudy03
//
//  Created by hanwe on 2020/05/03.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var demoData : DemoData
    @EnvironmentObject var envDemoData : DemoData // 모든 view가 읽을 수 있는 shared data
//    @EnvironmentObject var envHWData : HWData // 2개 넣을수는 없는듯?? 알아봐야함 ㅡㅡ
    
    @State private var wifiEnabled:Bool = true
    @State private var userName:String = "" {
        didSet { //바인딩을 시키면 작동을 안하는듯?????? 작동 할줄알았는데 안함
            print("userName:\(self.userName)")
        }
    }
    
    var body: some View {
        NavigationView { // 이런식으로 네비게이션을 만들 수 있다..
            VStack {
                Toggle(isOn: $wifiEnabled) { // 에러남. todo 수정
                    Text("Enable Wi-Fi")
                }
                TextField("Enter user name", text: $userName)
                Text(userName)
                WifiImageView(wifiEnabled: $wifiEnabled)
                
                Text("\(demoData.currentUser), you are user number \(demoData.userCount)")
                
                Text("this is env Data User Name:\(envDemoData.currentUser),count:\(envDemoData.userCount)")
                Button(action: {
                    self.envDemoData.userCount += 1
                }) {
                    Text("add envCount")
                }
                
                NavigationLink(destination: SecondView()) {
                    Text("nextScreen")
                }
            }
        }
    }
}

struct WifiImageView: View {
    
    @Binding var wifiEnabled: Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(demoData: DemoData(userCount: 2, currentUser: "test2")).environmentObject(DemoData(userCount: 4, currentUser: "test4"))
    }
}
