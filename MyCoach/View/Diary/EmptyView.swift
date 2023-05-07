//
//  EmptyView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 04/05/23.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Nessun dato salvato")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
