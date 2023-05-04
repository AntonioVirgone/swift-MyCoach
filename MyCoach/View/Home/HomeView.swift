//
//  HomeView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct HomeView: View {
    @State var balance = "10h"
    
    var body: some View {
        NavigationView {
            ZStack {
                bgAppColorDark.edgesIgnoringSafeArea(.all)
                VStack {
                    header
                    Spacer().frame(height: 20)
                    trainingCards
                    Spacer().frame(height: 40)
                    featureCards
                    Spacer()
                }
            }
        }
        .accentColor(bgAppColorDark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    private var header: some View {
        VStack(alignment: .leading) {
            Text("Hello, Antonio")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
            //NavigationLink(destination: ProfileView().toolbarRole(.editor)) {
            HStack {
                HStack(spacing: 10) {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(10)
                    VStack(alignment: .leading, spacing: 7) {
                        Text("your balance".uppercased())
                            .font(.system(size: 12, weight: .light, design: .rounded))
                            .foregroundColor(bgTitleCardColor)
                        Text(balance)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }
            .padding(10)
            .frame(minWidth: 350, alignment: .leading)
            .background(bgCardColor)
            .cornerRadius(15)
            //}
        }
        .padding()
    }
    
    private var trainingCards: some View {
        VStack(alignment: .leading) {
            Text("Achievements")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            HStack {
                TrainingCardView(title: "Scheda A", type: "A", count: "figure.stairs", color: color2)
                TrainingCardView(title: "Scheda B", type: "B", count: "figure.play", color: color3)
                TrainingCardView(title: "Scheda C", type: "C", count: "figure.strengthtraining.traditional", color: color4)
            }
        }
        .frame(minWidth: 350, alignment: .leading)
        .padding(10)
    }
    
    private var featureCards: some View {
        VStack(alignment: .leading) {
            Text("Advanced features")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
            VStack {
                HStack {
                    NavigationLink(destination: MealDiaryView().toolbarRole(.editor)) {
                        DiaryCardView(title: "Diario cibo", count: "frying.pan", description: "", color: bgCardColor)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 8))
                    }
                    
                    //NavigationLink(destination: MealDiaryFeatureView().toolbarRole(.editor)) {
                    DiaryCardView(title: "Diario bici", count: "figure.outdoor.cycle", description: "", color: bgCardColor)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 5, trailing: 0))
                    //}
                }
                HStack {
                    //NavigationLink(destination: MealDiaryFeatureView().toolbarRole(.editor)) {
                    DiaryCardView(title: "Diario gioco", count: "playstation.logo", description: "", color: bgCardColor)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 8))
                    //}
                    //NavigationLink(destination: MealDiaryFeatureView().toolbarRole(.editor)) {
                    DiaryCardView(title: "Diario salute", count: "cross.case", description: "", color: bgCardColor)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 5, trailing: 0))
                    //}
                }
            }
        }
    }
}
