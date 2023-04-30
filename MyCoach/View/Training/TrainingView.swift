//
//  TrainingView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct TrainingView: View {
    @State var trainingCardList = TrainingDataController.find()
    
    let title: String
    let type: String
    let color: Color
    
    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(color.opacity(0.4))
                List {
                    ForEach(trainingCardList, id: \.self) { trainingCard in
                        if (trainingCard.type == type) {
                            Section(header: Text(trainingCard.title).foregroundColor(.white)) {
                                ForEach(trainingCard.trainings, id: \.self) { training in
                                    TrainingRowView(color: color, training: training)
                                }
                            }
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(bgAppColor)
            }
            .navigationTitle(title)
            .font(.title2)
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(title: "", type: "A", color: .orange)
    }
}
