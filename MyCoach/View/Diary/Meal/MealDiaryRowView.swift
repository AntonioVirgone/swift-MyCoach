//
//  MealDiaryRowView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 06/05/23.
//

import SwiftUI

struct MealDiaryRowView: View {
    @StateObject private var foodViewModel = FoodViewModel()

    let title: String
    let type: String
    let description: String
    let date: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(type)
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .foregroundColor(foodViewModel.textColor)
            VStack(alignment: .leading) {
                Text("\(title)")
                    .foregroundColor(foodViewModel.textColor)
                Text("\(description)")
                    .foregroundColor(foodViewModel.textColor)
            }
            Text("\(date.formatted())")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .foregroundColor(.gray)
        }
        .onAppear {
            foodViewModel.setTextColor(type: type)
        }
        .foregroundColor(.white.opacity(0.8))
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
        .listRowSeparatorTint(.white)
        .listRowBackground(color5)
    }
}

struct MealDiaryRowView_Previews: PreviewProvider {
    static var previews: some View {
        MealDiaryRowView(title: "lorem", type: "Colazione", description: "ipsum", date: Date())
    }
}
