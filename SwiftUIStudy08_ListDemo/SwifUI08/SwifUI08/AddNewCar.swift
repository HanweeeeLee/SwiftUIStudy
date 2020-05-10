//
//  AddNewCar.swift
//  SwifUI08
//
//  Created by hanwe on 2020/05/10.
//  Copyright © 2020 hanwe. All rights reserved.
//

import SwiftUI

struct AddNewCar: View {
    
    @ObservedObject var carStore : CarStore
    
    @State var isHybrid = false
    @State var name:String = ""
    @State var descroption:String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                .resizable()
                    .aspectRatio(contentMode: .fit)
                .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $descroption)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                }.padding()
            }
            
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
    }
    
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString,
                         name: name,
                         description: descroption,
                         isHybrid: isHybrid,
                         imageName: "tesla_model_3")
        carStore.cars.append(newCar)
    }
    
}

struct DataInput: View {
    
    var title:String
    @Binding var userInput:String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
    
}

struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCar(carStore: CarStore(cars: carData))
    }
}
