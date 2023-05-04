//
//  MyCoachApp.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

let bgTitleCardColor = Color(#colorLiteral(red: 1, green: 0.4901960784, blue: 0.1215686275, alpha: 1))
let bgCardColor = Color(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1843137255, alpha: 1))
let color1 = Color(#colorLiteral(red: 1, green: 0.4901960784, blue: 0.1215686275, alpha: 1))
let color2 = Color(#colorLiteral(red: 1, green: 0.5764705882, blue: 0.2745098039, alpha: 1))
let color3 = Color(#colorLiteral(red: 0.7490196078, green: 0.9176470588, blue: 0.7254901961, alpha: 1))
let color4 = Color(#colorLiteral(red: 0.6784313725, green: 0.9450980392, blue: 0.9843137255, alpha: 1))
let color5 = Color(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1843137255, alpha: 1))
let bgAppColorDark = Color(#colorLiteral(red: 0.1098039216, green: 0.1176470588, blue: 0.1411764706, alpha: 1))
let bgAppColorLigth = Color(#colorLiteral(red: 0.8172722626, green: 0.8172722626, blue: 0.8172722626, alpha: 1))
let loadScheda = false

let bgAppColor: some View = ZStack {
    VStack(spacing: 0) {
        ForEach((1...10).reversed(), id: \.self) { i in
            HStack(spacing: 0) {
                ForEach((1...5).reversed(), id: \.self) { i in
                    bgAppColorLigth
                    bgAppColorDark
                }
            }
            HStack(spacing: 0) {
                ForEach((1...5).reversed(), id: \.self) { i in
                    bgAppColorDark
                    bgAppColorLigth
                }
            }
        }
    }.edgesIgnoringSafeArea(.all)
}


@main
struct MyCoachApp: App {
    var body: some Scene {
        WindowGroup {
            if loadScheda {
                UploadDataView()
            } else {
                HomeView()
            }
        }
    }
}
