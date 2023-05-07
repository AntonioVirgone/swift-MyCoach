//
//  HealthDiaryRowView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 06/05/23.
//

import SwiftUI

struct HealthDiaryRowView: View {
    @StateObject private var healthViewModel = HealthViewModel()

    let time: String
    let type: String
    let description: String
    let date: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(type)
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .foregroundColor(healthViewModel.textColor)
            VStack(alignment: .leading) {
                Text("\(time)")
                    .foregroundColor(healthViewModel.textColor)
                Text("\(description)")
                    .foregroundColor(healthViewModel.textColor)
            }
            Text("\(date.formatted())")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .foregroundColor(.gray)
        }
        .onAppear {
            healthViewModel.setTextColor(type: type)
        }
        .foregroundColor(.white.opacity(0.8))
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
        .listRowSeparatorTint(.white)
        .listRowBackground(color5)
    }
}

struct HealthDiaryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HealthDiaryRowView(time: "lorem", type: "Colazione", description: "ipsum", date: Date())
    }
}
