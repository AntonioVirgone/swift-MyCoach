//
//  TrainingRowView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct TrainingRowView: View {
    let color: Color
    let training: TrainingModel

    var body: some View {
        if (training.addRepetition) {
            navigationRow
        } else {
            standardRow
        }
    }
}

struct TrainingRowView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingRowView(color: .orange, training: TrainingModel(id: UUID(),
                                                                code: "",
                                                                value: "",
                                                                series: 10,
                                                                repetition: 10,
                                                                relax: 10,
                                                                addRepetition: true,
                                                                addWeigth: true))
    }
}

extension TrainingRowView {
    private var navigationRow: some View {
        NavigationLink(destination: RepetitionView(color: color, training: training)) {
        Text(training.value)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.black)
                .font(.system(size: 14))
                .fontWeight(.bold)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(bgAppColor, lineWidth: 0.2)
                )
         }
        .listRowSeparator(.hidden)
        .listRowBackground(color)
    }
    
    private var standardRow: some View {
        Text(training.value)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.black)
            .font(.system(size: 14))
            .fontWeight(.bold)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(bgAppColor, lineWidth: 0.2)
            )
            .listRowSeparator(.hidden)
            .listRowBackground(color)
    }
}
