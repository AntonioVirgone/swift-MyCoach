//
//  MealSelectorView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 03/05/23.
//

import SwiftUI

struct MealSelectorView: View {
    @Environment(\.dismiss) var dismiss

    @State private var showingAddBreackfast = false
    @State private var showingAddLunch = false
    @State private var showingAddDinner = false
    
    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(Color.orange.opacity(0.4))
                Spacer()
                VStack(spacing: 15) {
                    Image(systemName: "frying.pan")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0))

                    Button {
                        showingAddBreackfast.toggle()
                    } label: {
                        Text("Colazione")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .background(color2.opacity(0.6))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                    }
                    .sheet(isPresented: $showingAddBreackfast) {
                        AddFoodView(title: "Colazione", dismiss: dismiss)
                    }
                    Button {
                        showingAddLunch.toggle()
                    } label: {
                        Text("Pranzo")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .background(color3.opacity(0.6))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                    }
                    .sheet(isPresented: $showingAddLunch) {
                        AddFoodView(title: "Pranzo", dismiss: dismiss)
                    }
                    Button {
                        showingAddDinner.toggle()
                    } label: {
                        Text("Cena")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .background(color4.opacity(0.6))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                    }
                    .sheet(isPresented: $showingAddDinner) {
                        AddFoodView(title: "Cena", dismiss: dismiss)
                    }
                    
                }
                Spacer()
            }
            .navigationTitle("Diario cibo")
            .font(.title2)
        }
    }
}

struct MealSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MealSelectorView()
    }
}
