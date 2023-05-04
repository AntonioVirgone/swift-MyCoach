//
//  CounterView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct CounterView: View {
    @State var counter: Int
    @State private var isActiveDrarw = false
        
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            VStack {
                Text("\(counter) sec")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .onReceive(timer) { _ in
                        let initCounter = counter
                        
                        if counter > 0 {
                            counter -= 1
                        } else {
                            counter = initCounter
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(bgTitleCardColor.gradient)
                }
                .frame(width: isActiveDrarw ? 300 : 2, height: isActiveDrarw ? 2 : 20, alignment: .leading)
                .animation(.easeInOut(duration: Double(counter)), value: isActiveDrarw)
                .onAppear {
                    isActiveDrarw.toggle()
                }
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(counter: 30)
    }
}
