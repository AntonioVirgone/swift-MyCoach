//
//  HealthModel.swift
//  MyCoach
//
//  Created by Antonio Virgone on 06/05/23.
//

import Foundation

struct HealthModel: Hashable {
    let id: UUID
    let time: String
    let type: String
    let weight: Double
    let date: Date
}
