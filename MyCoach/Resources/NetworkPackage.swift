//
//  NetworkPackage.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import Foundation

public struct NetworkPackage {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func loadFromJson<T: Decodable>(file: URL) -> T {
        loadFromFile(file)
    }
}
