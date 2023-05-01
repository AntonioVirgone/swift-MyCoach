//
//  ReportCardView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct ReportCardView: View {
    let count: Int
    let title: String
    let textColor: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(count)")
                .font(.system(size: 21, weight: .bold, design: .rounded))
                .foregroundColor(textColor)
            Text(title)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(textColor)
        }
        .frame(width: 110, height: 75)
        .background(bgCardColor)
        .cornerRadius(10)
        .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
    }
}

struct ReportCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCardView(count: 2,
                       title: "Tempo",
                       textColor: Color.white)
    }
}
