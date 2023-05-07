//
//  RepetitionCardView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 01/05/23.
//

import SwiftUI

struct RepetitionCardView: View {
    let repetition: RepetitionModel
    let training: TrainingModel
    let color: Color
    
    var body: some View {
        NavigationLink(destination: EditRepetitionCardView(number: repetition.number, weigth: repetition.weigth, isActiveAddWeight: training.addWeigth, title: training.value, code: repetition.id, colorBar: color)) {
            HStack {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 3) {
                        Text("\(Int(repetition.number)) ripetioni")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Text("\(repetition.date.formatted())")
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                    }
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    Text("\(Int(repetition.weigth)) kg")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
            .background(bgCardColor)
            .cornerRadius(15)
        }
    }
}

struct RepetitionCardView_Previews: PreviewProvider {
    static var previews: some View {
        RepetitionCardView(repetition: RepetitionModel(id: UUID(),
                                                       date: Date(),
                                                       number: 0,
                                                       weigth: 0,
                                                       trainingCode: "code"),
                           training: TrainingModel(id: UUID(),
                                                   code: "code",
                                                   orderNumber: 1,
                                                   value: "value",
                                                   series: 1,
                                                   repetition: 1,
                                                   relax: 10,
                                                   addRepetition: true,
                                                   addWeigth: true),
                           color: .orange)
    }
}
