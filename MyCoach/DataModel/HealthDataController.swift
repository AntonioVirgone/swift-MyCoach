//
//  HealthDataController.swift
//  MyCoach
//
//  Created by Antonio Virgone on 06/05/23.
//

import Foundation
import CoreData

class HealthDataController: ObservableObject {
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyCoachDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print(error)
            }
        }
        return container
    }()
    
    static func save(type: String, time: String, weigth: Double) {
        print("save data")
        let health = HealthEntity(context: context)
        health.id = UUID()
        health.type = type
        health.time = time
        health.weigth = weigth
        health.date = Date()
        
        save()
    }
    
    static func delete(id: UUID) {
        let fetchRequest = HealthEntity.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(
            format: "id = '\(id)'"
        )
        
        do {
            let health = try context.fetch(fetchRequest).first
            context.delete(health!)
            
            save()
        } catch {
            print(error)
        }
    }
    
    static func save() {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Error in save data")
        }
    }
    
    static func find() -> [HealthModel] {
        let fetchRequest = HealthEntity.fetchRequest()
        do {
            var array = [HealthModel]()
            let healthList = try context.fetch(fetchRequest)
            
            for health in healthList {
                array.append(HealthModel(id: health.id ?? UUID(),
                                         time: health.time ?? "",
                                         type: health.type ?? "",
                                         weight: health.weigth,
                                         date: health.date ?? Date()))
            }
            
            var sortedArray: [HealthModel] {
                return array.sorted { $0.date > $1.date }
            }
            return sortedArray
        } catch {
            print(error)
            return []
        }
    }
}
