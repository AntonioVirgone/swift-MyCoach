//
//  MealSaveView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 06/05/23.
//

import SwiftUI

struct MealSaveView: View {
    @StateObject private var foodViewModel = FoodViewModel()
    @Environment(\.dismiss) var dismiss

    var meals = [BREACKFAST, LUNCH, DINNER]
    var quantity = ["pz", "tz", "gr", "ml", "lt"]
    
    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image(systemName: "frying.pan")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                Spacer()
                VStack(spacing: 40) {
                    Picker("Scegli il tipo di pasto", selection: $foodViewModel.type) {
                        ForEach(meals, id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    HStack {
                        Text("Alimento: ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        TextField("", text: $foodViewModel.name)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    VStack(alignment: .leading) {
                        Text("Peso: \(Int(foodViewModel.weigth))")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        Slider(value: $foodViewModel.weigth, in: 0...250, step: 1)
                    }
                    Picker("Please choose a color", selection: $foodViewModel.quantity) {
                        ForEach(quantity, id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    HStack {
                        Button {
                            foodViewModel.save()
                            dismiss()
                        } label: {
                            Text("Save")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundColor(.black.opacity(0.4))
                                .frame(width: 120, height: 50)
                                .background(buttonColor1.opacity(0.6))
                                .cornerRadius(10)
                                .padding(EdgeInsets(top: 30, leading: 2, bottom: 0, trailing: 2))
                        }
                        Button {
                            dismiss()
                        } label: {
                            Text("Close")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundColor(.black.opacity(0.4))
                                .frame(width: 120, height: 50)
                                .background(buttonColor2.opacity(0.6))
                                .cornerRadius(10)
                                .padding(EdgeInsets(top: 30, leading: 2, bottom: 0, trailing: 2))
                        }
                    }
                }
                Spacer()
            }
            .foregroundColor(.white.opacity(0.8))
            .padding()
        }
    }
}

struct MealSaveView_Previews: PreviewProvider {
    static var previews: some View {
        MealSaveView()
    }
}
