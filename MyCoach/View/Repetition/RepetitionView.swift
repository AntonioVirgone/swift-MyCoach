//
//  RepetitionView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct RepetitionView: View {
    @State private var repetitions = RepetitionDataController.find()
    @Environment(\.dismiss) private var dismiss
    
    @State private var number: Double = 0
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
                insertRepetition
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
    
    private func deleteRepetition(offsets: IndexSet) {
        _ = withAnimation {
            offsets.map {
                RepetitionDataController.deleteRepetition(repetitionId: repetitions[$0].id)
                repetitions = RepetitionDataController.find()
            }
        }
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
                List {
                    ForEach(repetitions, id: \.self) { repetition in
                        if training.code == repetition.trainingCode {
                            RepetitionCardView(repetition: repetition, training: training, color: color)
                                .listRowSeparator(.hidden)
                                .listRowBackground(bgAppColor)
                        }
                    }
                    .onDelete(perform: deleteRepetition)
                }
                .ignoresSafeArea()
                .scrollContentBackground(.hidden)
                .background(bgAppColor)
            }
            else {
                Spacer()
            }
        }
    }
    
    private var insertRepetition: some View {
        VStack {
            VStack {
                Text("Ripetizioni: \(Int(number))")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                Slider(value: $number, in: 0...60, step: 1)
            }
            VStack {
                Text("Peso: \(Int(weigth))")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                Slider(value: $weigth, in: 0...150, step: 1)
            }
            Spacer()
                .frame(height: 30)
            HStack {
                Spacer()
                Button {
                    RepetitionDataController.addRepetition(number: number, weigth: weigth, trainingCode: training.code ?? "")
                    repetitions = RepetitionDataController.find()
                } label: {
                    Text("Save")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(color5)
                        .frame(width: 130, height: 50)
                        .background(color1)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                }
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Close")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(color1)
                        .frame(width: 130, height: 50)
                        .background(color5)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                    
                }
                Spacer()
            }
            .listRowSeparator(.hidden)
        }
        .navigationTitle(training.value)
        .font(.title2)
        .foregroundColor(.white)
        .padding()
        .background(bgAppColor)
    }
}
