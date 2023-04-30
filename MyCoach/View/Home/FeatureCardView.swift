//
//  FeatureCardView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct FeatureCardView: View {
    let title: String
    let count: String
    let description: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(systemName: count)
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text(description)
                    .font(.system(size: 12, weight: .light, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.light)
            }
        }
        .padding(15)
        .frame(width: 160, height: 130, alignment: .leading)
        .background(color)
        .cornerRadius(10)
    }
}

struct FeatureCardView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCardView(title: "Bananas", count: "gamecontroller", description: "$10.230 (54.4 %)", color: Color(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1843137255, alpha: 1)))
    }
}
