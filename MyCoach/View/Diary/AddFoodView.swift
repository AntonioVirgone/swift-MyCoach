//
//  AddFoodView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 03/05/23.
//

import SwiftUI

struct AddFoodView: View {
    @State private var foods = FoodDataController.find()
    @State private var number: Double = 0
    @State private var weigth: Double = 0
    @State private var selectedColor = "Green"
    
    let title: String
    let dismiss: DismissAction?
    
    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(Color.orange.opacity(0.4))
                Spacer()
                VStack {
                    Picker("Please choose a color", selection: $selectedColor) {
                        ForEach(foods, id: \.self) { food in
                            Text(food.name).tag(food)
                        }
                    }
                    Text("You selected: \(selectedColor)")
                    HStack {
                        Text("Ripetizioni: ")
                        TextField("Ripetizioni", value: $number, formatter: NumberFormatter())
                    }
                    VStack {
                        Text("Peso: \(Int(weigth))")
                        Slider(value: $weigth, in: 0...150, step: 5)
                    }
                    Button {
                        FoodDataController.saveFood(
                            name: selectedColor,
                            weigth: "\(weigth)")
                        dismiss!()
                    } label: {
                        Text("Save").foregroundColor(.green)
                    }
                    .padding()
                    
                    Button {
                        dismiss!()
                    } label: {
                        Text("Close").foregroundColor(.red)
                    }
                    .padding()
                }
                Spacer()
            }
            .foregroundColor(.white.opacity(0.8))
            .padding()
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(title: "Hello world", dismiss: nil)
    }
}
