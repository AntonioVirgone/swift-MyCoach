//
//  TrainingModel.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import Foundation

struct TrainingModel: Hashable, Codable {
    let id: UUID?
    let code: String?
    let value: String
    let series: Double?
    let repetition: Double?
    let relax: Double?
    let addRepetition: Bool
    let addWeigth: Bool
}
