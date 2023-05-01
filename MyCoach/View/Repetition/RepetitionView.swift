//
//  RepetitionView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct RepetitionView: View {
    @State private var repetitions = RepetitionDataController.find()
    @State private var number:Double = 0
    @State private var weigth: Double = 0

    let color: Color
    let training: TrainingModel

    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(color.opacity(0.4))
                //InsertRepetitionDataView(isEditMode:false, title: title, isActiveAddWeight: isActiveAddWeight, exerciseCode: exerciseCode)
                Spacer()
                    .frame(height: 40)
                RelaxButtonView(counter: Int(training.relax!))
                Spacer()
                    .frame(height: 40)
                reportList
                Spacer()
                    .frame(height: 40)
                repetitionList
            }
        }
    }
    
    private func countRepetition() -> Int {
        var count = 0
        for repetition in repetitions {
            if training.code == repetition.trainingCode {
                count += 1
            }
        }
        return count
    }
    
    private func calculateMiddleweight() -> Int {
        var middle = 0
        if repetitions.count > 0 {
            for repetition in repetitions {
                if training.code == repetition.trainingCode {
                    middle += Int(repetition.weigth)
                }
            }
            return middle / repetitions.count
        }
        return middle
    }
    
    private func calculateMiddlerepetition() -> Int {
        var middle = 0
        if repetitions.count > 0 {
            for repetition in repetitions {
                if training.code == repetition.trainingCode {
                    middle += Int(repetition.number)
                }
            }
            return middle / repetitions.count
        }
        return middle
    }
    
    private func calculateMiddleexecution() -> Int {
        var middle = 0
        for repetition in repetitions {
            if training.code == repetition.trainingCode {
                middle += 1
            }
        }
        return middle
    }
}

struct RepetitionView_Previews: PreviewProvider {
    static var previews: some View {
        RepetitionView(color: .orange, training: TrainingModel(id: UUID(),
                                                               code: "",
                                                               value: "",
                                                               series: 10,
                                                               repetition: 10,
                                                               relax: 10,
                                                               addRepetition: true,
                                                               addWeigth: true))
    }
}

extension RepetitionView {
    private var reportList: some View {
        VStack {
            Text("Valori medi per \(training.value)")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            HStack {
                ReportCardView(count: calculateMiddleweight(),
                               title: "Peso",
                               textColor: Color.white)
                ReportCardView(count: calculateMiddlerepetition(),
                               title: "Ripetizioni",
                               textColor: Color.white)
                ReportCardView(count: calculateMiddleexecution(),
                               title: "Volte",
                               textColor: Color.white)
            }
        }
    }
    
    private var repetitionList: some View {
        VStack(alignment: .leading) {
            if (countRepetition() > 0) {
                Text("Posts \(countRepetition())")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                /*
                List {
                    ForEach(repetitions, id: \.self) { repetition in
                        if exerciseCode == repetition.trainingCode {
                            NavigationLink(destination: EditRepetitionView(repetition: repetition, colorBar: colorBar)) {
                                PostCardView(profileName: "\(Int(repetition.number)) ripetioni",
                                             datetime: "\(repetition.date!.formatted())",
                                             description: "\(Int(repetition.weigth)) kg")
                                
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(bgAppColor)
                        }
                    }
                    .onDelete(perform: deleteRepetition)
                }
                .ignoresSafeArea()
                .scrollContentBackground(.hidden) // HERE
                .background(bgAppColor)
                 */
            }
            else {
                Spacer()
            }
        }
    }
}
