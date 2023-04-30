//
//  JsonDecode.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import Foundation

func loadFromFile<T: Decodable>(_ file: URL) -> T {
    let data: Data
    print(file)
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(file) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(file) as \(T.self):\n\(error)")
    }
}
