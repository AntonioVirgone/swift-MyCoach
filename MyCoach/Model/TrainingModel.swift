//
//  TrainingModel.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import Foundation

struct TrainingModel: Hashable, Codable {
    let id: UUID
    let code: String?
    let value: String
    let serie: Int?
    let ripetizioni: Int?
    let riposo: Int?
    let addRepetition: Bool
    let addWeigth: Bool
}
