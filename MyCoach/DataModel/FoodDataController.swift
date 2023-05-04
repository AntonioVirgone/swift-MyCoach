//
//  FoodDataController.swift
//  MyCoach
//
//  Created by Antonio Virgone on 03/05/23.
//

import Foundation
import CoreData

class FoodDataController: ObservableObject {
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
    
    static func saveFood(name: String, weigth: String) {
        print("save food")
        let food = FoodEntity(context: context)
        food.id = UUID()
        food.name = name
        food.quantity = weigth
        food.date = Date()
        
        save()
    }
    
    static func deleteRepetition(repetitionId: UUID) {
        let fetchRequest = FoodEntity.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(
            format: "id = '\(repetitionId)'"
        )

        do {
            let food = try context.fetch(fetchRequest).first
            context.delete(food!)
            
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
    
    static func find() -> [FoodModel] {
        let fetchRequest = FoodEntity.fetchRequest()
        do {
            var array = [FoodModel]()
            let schede = try context.fetch(fetchRequest)
            
            for scheda in schede {
                array.append(FoodModel(id: scheda.id ?? UUID(), name: scheda.name ?? "", weight: scheda.quantity ?? ""))
            }
            
            return array
        } catch {
            print(error)
            return []
        }
    }
}
