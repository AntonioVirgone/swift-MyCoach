//
//  InsertRepetitionView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 01/05/23.
//

import SwiftUI

struct EditRepetitionCardView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var number: Double = 0
    @State var weigth: Double = 0
    
    let isActiveAddWeight: Bool
    let title: String
    let code: UUID
    let colorBar: Color
    
    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(colorBar.opacity(0.4))
                Spacer()
                VStack {
                    VStack {
                        Text(title)
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .padding()
                        Text("Ripetizioni: \(Int(number))")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        Slider(value: $number, in: 0...60, step: 1)
                    }
                    if (isActiveAddWeight) {
                        VStack {
                            Text("Peso: \(Int(weigth))")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                            Slider(value: $weigth, in: 0...150, step: 1)
                        }
                    }
                    Spacer()
                        .frame(height: 30)
                    HStack {
                        Spacer()
                        Button {
                            RepetitionDataController.editRepetition(number: number, weigth: weigth, repetitionId: code)
                            dismiss()
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
                .navigationTitle(title)
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .background(bgAppColor)
                Spacer()
            }
        }
    }
}

struct InsertRepetitionView_Previews: PreviewProvider {
    static var previews: some View {
        EditRepetitionCardView(isActiveAddWeight: true,
                               title: "title",
                               code: UUID(),
                               colorBar: .orange)
    }
}
