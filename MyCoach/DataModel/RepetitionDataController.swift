//
//  RepetitionDataController.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import Foundation
import CoreData

class RepetitionDataController: ObservableObject {
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
    
    static func addRepetition(number: Double, weigth: Double, trainingCode: String) {
        let repetition = RepetitionEntity(context: context)
        repetition.id = UUID()
        repetition.date = Date()
        repetition.number = number
        repetition.weigth = weigth
        repetition.trainingCode = trainingCode
        
        save()
    }
    
    static func find() -> [RepetitionModel] {
        let fetchRequest: NSFetchRequest<RepetitionEntity>
        fetchRequest = RepetitionEntity.fetchRequest()
        
        do {
            var array = [RepetitionModel]()
            let repetitionList = try context.fetch(fetchRequest)
            for repetition in repetitionList {
                array.append(RepetitionModel(id: repetition.id ?? UUID(), date: repetition.date ?? Date(), number: repetition.number, weigth: repetition.weigth, trainingCode: repetition.trainingCode ?? ""))
            }
            return array
        } catch {
            return []
        }
    }
    
    static func editRepetition(number: Double, weigth: Double, repetitionId: UUID) {
        let fetchRequest: NSFetchRequest<RepetitionEntity>
        fetchRequest = RepetitionEntity.fetchRequest()
        
        //MARK: non funziona la select
        fetchRequest.predicate = NSPredicate(
            format: "id = '\(repetitionId))'"
        )
        
        do {
            let repetition = try context.fetch(fetchRequest).first
            repetition!.number = number
            repetition!.weigth = weigth
            
            save()
        } catch {
            print(error)
        }
    }
    
    static func deleteRepetition(repetitionId: UUID) {
        let fetchRequest = RepetitionEntity.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(
            format: "id = '\(repetitionId)'"
        )
        
        do {
            let repetition = try context.fetch(fetchRequest).first
            context.delete(repetition!)
            
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
            print("Error save repetition, \(error)")
        }
    }
}
