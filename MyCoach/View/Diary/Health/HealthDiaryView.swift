//
//  HealthDiaryFeatureView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 06/05/23.
//

import SwiftUI

struct HealthDiaryView: View {
    @StateObject private var healthViewModel = HealthViewModel()

    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(Color.orange.opacity(0.4))
                Spacer()
                VStack(spacing: 15) {
                    NavigationLink(destination: HealthSaveView()) {
                        Text("Misura glicemia")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.black.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .background(color2.opacity(0.6))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 30, leading: 2, bottom: 0, trailing: 2))
                    }
                }
                Spacer()
                if (healthViewModel.healthList.count > 0) {
                    List {
                        ForEach(healthViewModel.healthList, id: \.self) { element in
                            HealthDiaryRowView(time: element.time,
                                               type: element.type,
                                               description: "\(element.weight)",
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
            .navigationTitle("Diario salute")
            .font(.title2)
        }
        .onAppear {
            print("appear")
            healthViewModel.load()
        }
    }
    
    private func deleteRepetition(offsets: IndexSet) {
        _ = withAnimation {
            offsets.map {
                healthViewModel.delete(id: healthViewModel.healthList[$0].id)
            }
        }
    }
}

struct HealthDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        HealthDiaryView()
    }
}
