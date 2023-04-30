//
//  TrainingCardModel.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import Foundation

struct TrainingCardModel: Hashable, Codable {
    let id: UUID
    let title: String
    let type: String
    let excercises: [TrainingModel]
}
