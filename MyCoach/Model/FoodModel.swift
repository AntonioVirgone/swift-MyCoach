//
//  FoodModel.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import Foundation

struct FoodModel: Hashable {
    let id: UUID
    let name: String
    let type: String
    let weight: Double
    let quantity: String
    let date: Date
}
