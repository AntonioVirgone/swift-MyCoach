//
//  TrainingCardView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct TrainingCardView: View {
    var title: String
    var type: String
    var count: String
    var color: Color
    
    var body: some View {
        NavigationLink(destination: TrainingView(title: title, type: type, color: color).toolbarRole(.editor)) {
            VStack {
                Image(systemName: count)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .padding(20)
                Text(title)
            }
            .frame(width: 110, height: 110)
            .background(color)
            .cornerRadius(10)
            .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
        }
        .foregroundColor(.black)
    }
}

struct TrainingCardView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingCardView(title: "Scheda A", type: "A", count: "figure.stairs", color: .orange)
    }
}
