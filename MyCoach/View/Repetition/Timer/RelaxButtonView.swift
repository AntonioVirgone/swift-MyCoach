//
//  RelaxButtonView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct RelaxButtonView: View {
    @State var drawingWidth = false
    
    let counter: Int

    var body: some View {
        VStack(spacing: 0) {
            Button {
                drawingWidth.toggle()
            } label: {
                Text(!drawingWidth ? "Attiva riposo" : "Disattiva riposo")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(color5)
                    .frame(width: 300, height: 25)
                    .background(color1)
                    .cornerRadius(7)
                    .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
            }
            if drawingWidth {
                CounterView(counter: counter)
                    .frame(height: 40)
            }
        }
    }
}

struct RelaxButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RelaxButtonView(counter: 10)
    }
}
