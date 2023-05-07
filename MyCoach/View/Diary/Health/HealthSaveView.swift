//
//  HealthSaveView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 06/05/23.
//

import SwiftUI

struct HealthSaveView: View {
    @StateObject private var healthViewModel = HealthViewModel()
    @Environment(\.dismiss) var dismiss

    var meals = [BREACKFAST, LUNCH, DINNER]
    var times = ["prima", "2h dopo"]
    
    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image(systemName: "cross.case")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                Spacer()
                VStack(spacing: 40) {
                    Picker("Scegli il tipo", selection: $healthViewModel.type) {
                        ForEach(meals, id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Picker("Scegli quando", selection: $healthViewModel.time) {
                        ForEach(times, id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    VStack(alignment: .leading) {
                        Text("Glicemia: \(Int(healthViewModel.weigth))")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        Slider(value: $healthViewModel.weigth, in: 50...250, step: 1)
                    }
                    HStack {
                        Button {
                            healthViewModel.save()
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

struct HealthSaveView_Previews: PreviewProvider {
    static var previews: some View {
        HealthSaveView()
    }
}
