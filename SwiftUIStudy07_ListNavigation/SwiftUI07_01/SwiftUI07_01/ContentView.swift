//
//  ContentView.swift
//  SwiftUI07_01
//
//  Created by hanwe on 2020/05/10.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct TodoItem : Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

var listData: [TodoItem] = [
    TodoItem(task: "Take out trash", imageName: "trash.circle.fill"),
    TodoItem(task: "Pick up the kids", imageName: "person.2.fill"),
    TodoItem(task: "Wash the car", imageName: "car.fill")
]

struct ContentView: View {
    
    @State var toggleStatus = true
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {//정적리스트
                    List {
                        HStack {
                            Image(systemName: "trash.circle.fill")
                            Text("Take out the trash")
                        }
                        HStack {
                            Image(systemName: "person.2.fill")
                            Text("Pick up the kids")
                        }
                        HStack {
                            Image(systemName: "car.fill")
                            Text("Wash the car")
                        }
                    }
                }
                VStack {// 동적리스트
                    List {
                        Section(header:Text("Setting")) {
                            Toggle(isOn: $toggleStatus) {
                                Text("Allow Notifications")
                            }
                        }
                        Section(header:Text("Todo Tasks")) {
                            ForEach (listData) { item in
                                HStack {
                                    NavigationLink(destination: Text(item.task)) {
                                        Image(systemName: item.imageName)
                                        Text(item.task)
                                    }
                                }
                            }
                            .onDelete(perform: deleteItem)
//                            .onMove(perform: moveItem)
                        }
                    }
                .navigationBarTitle(Text("To Do List"))

                    .navigationBarItems(trailing: Button(action: addTask){
                        Text("add")
                    })
                }
//                .navigationBarItems(leading: EditButton())
                
            }
        }
    }

    func addTask() {
        print("오잉..")
//        ForEach (listData) { item in
//            print("item:\(item.task)")
//        }
    }
    func deleteItem(at offset:IndexSet) {
        // 데이터 소스에서 항목을 삭제하는 코드가 여기 온다
        print("delete At offSet :\(offset)")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
