//
//  MealDiaryView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 03/05/23.
//

import SwiftUI

struct MealDiaryView: View {
    @State private var foods = FoodDataController.find()
    @State private var showingAddBreackfast = false

    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(Color.orange.opacity(0.4))
                Spacer()
                VStack(spacing: 15) {
                    Button {
                        showingAddBreackfast.toggle()
                    } label: {
                        Text("Aggiungi pasto")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .background(color2.opacity(0.6))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 30, leading: 2, bottom: 0, trailing: 2))
                    }
                    .sheet(isPresented: $showingAddBreackfast) {
                        MealSelectorView()
                    }
                }
                Spacer()
                if (foods.count > 0) {
                    List {
                        ForEach(foods, id: \.self) { element in
                            VStack(alignment: .leading) {
                                Text("title \(element.name)")
                                Text("description \(element.weight)")
                            }
                            .foregroundColor(.white.opacity(0.8))
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                            .listRowSeparatorTint(.white)
                            .listRowBackground(color5)
                        }
                        .onDelete(perform: deleteRepetition)
                    }
                    .scrollContentBackground(.hidden) // HERE
                    .background(bgAppColorDark)
                } else {
                    Spacer()
                }
            }
            .navigationTitle("Diario cibo")
            .font(.title2)
        }
        .onAppear {
            foods = FoodDataController.find()
        }
    }
    
    private func deleteRepetition(offsets: IndexSet) {
        _ = withAnimation {
            offsets.map {
                FoodDataController.deleteRepetition(repetitionId: foods[$0].id)
                foods = FoodDataController.find()
            }
        }
    }
}

struct MealDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        MealDiaryView()
    }
}
