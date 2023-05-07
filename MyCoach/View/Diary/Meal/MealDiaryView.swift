//
//  MealDiaryView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 03/05/23.
//

import SwiftUI

struct MealDiaryView: View {
    @StateObject private var foodViewModel = FoodViewModel()

    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(Color.orange.opacity(0.4))
                Spacer()
                VStack(spacing: 15) {
                    NavigationLink(destination: MealSaveView()) {
                        Text("Aggiungi pasto")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.black.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .background(color2.opacity(0.6))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 30, leading: 2, bottom: 0, trailing: 2))
                    }
                }
                Spacer()
                if (foodViewModel.foods.count > 0) {
                    List {
                        ForEach(foodViewModel.foods, id: \.self) { element in
                            MealDiaryRowView(title: element.name,
                                             type: element.type,
                                             description: "\(element.weight) \(element.quantity)",
                                             date: element.date)
                        }
                        .onDelete(perform: deleteRepetition)
                    }
                    .scrollContentBackground(.hidden) // HERE
                    .background(bgAppColorDark)
                } else {
                    EmptyView()
                }
            }
            .navigationTitle("Diario cibo")
            .font(.title2)
        }
        .onAppear {
            print("appear")
            foodViewModel.load()
        }
    }
    
    private func deleteRepetition(offsets: IndexSet) {
        _ = withAnimation {
            offsets.map {
                foodViewModel.delete(id: foodViewModel.foods[$0].id)
            }
        }
    }
}

struct MealDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        MealDiaryView()
    }
}
