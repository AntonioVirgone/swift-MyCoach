//
//  FoodViewModel.swift
//  MyCoach
//
//  Created by Antonio Virgone on 06/05/23.
//

import Foundation
import SwiftUI

@MainActor class FoodViewModel: ObservableObject {
    @Published var foods = FoodDataController.find()
    @Published var name: String = ""
    @Published var type: String = BREACKFAST
    @Published var number: Double = 0
    @Published var weigth: Double = 0
    @Published var quantity: String = "gr"
    @Published var textColor = Color.gray

    func save() {
        print("save new element")
        FoodDataController.saveFood(name: name, weigth: weigth, quanity: quantity, type: type)
        load()
    }
    
    func delete(id: UUID) {
        print("delete element \(id)")
        FoodDataController.deleteRepetition(repetitionId: id)
        load()
    }
    
    func load() {
        print("load element")
        foods = FoodDataController.find()
    }
    
    func setTextColor(type: String) {
        switch type {
        case "Colazione":
            textColor = Color(#colorLiteral(red: 0.7079303075, green: 0.4735726294, blue: 0.2830637503, alpha: 1))
        case "Pranzo":
            textColor = Color(#colorLiteral(red: 0.7254430245, green: 0.7493076224, blue: 0.6355524228, alpha: 1))
        case "Cena":
            textColor = Color(#colorLiteral(red: 0.3398815599, green: 0.6468874008, blue: 0.5850487827, alpha: 1))
        default:
            textColor = Color.gray
        }
    }
}
