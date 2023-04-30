//
//  TrainingDataController.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import Foundation
import CoreData
import NetworkPackage

class TrainingDataController: ObservableObject {
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyCoachDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("error \(error)")
            }
        }
        return container
    }()
    
    static func savePost(filename: String) {
        let trainingCardModelList = getData(filename: filename)
        for trainingCardModel in trainingCardModelList {
            saveData(trainingCardModel: trainingCardModel)
        }
    }
    
    static func saveData(trainingCardModel: TrainingCardModel) {
        let trainingCardEntity = TrainingCardEntity(context: context)
        var trainingEnityList = [TrainingEnity]()
        
        for training in trainingCardModel.trainings {
            let trainingEnity = TrainingEnity(context: context)
            trainingEnity.code = training.code
            trainingEnity.repetition = training.repetition ?? 0
            trainingEnity.relax = training.relax ?? 0
            trainingEnity.series = training.series ?? 0
            trainingEnity.value = training.value
            trainingEnity.addRepetition = training.addRepetition
            trainingEnity.addWeigth = training.addWeigth
            trainingEnityList.append(trainingEnity)
        }
        trainingCardEntity.id = UUID()
        trainingCardEntity.title = trainingCardModel.title
        trainingCardEntity.type = trainingCardModel.type
        trainingCardEntity.relationship = NSSet.init(array: trainingEnityList)
        
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Error in save data")
        }
    }
    
    static func getData(filename: String) -> [TrainingCardModel] {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        return loadFromFile(file)
    }
    
    static func delete() {
        do {
            let fetchRequest = TrainingCardEntity.fetchRequest()
            let trainingCardEntityList = try context.fetch(fetchRequest)
            
            for trainingCardEntity in trainingCardEntityList {
                context.delete(trainingCardEntity)
            }
        } catch {
            print(error)
        }
    }
    
    static func find() -> [TrainingCardModel] {
        let fetchRequest = TrainingCardEntity.fetchRequest()
        do {
            var trainingCardModelList = [TrainingCardModel]()
            let trainingCardEntityList = try context.fetch(fetchRequest)
            
            for trainingCardEntity in trainingCardEntityList {
                var trainingModelList = [TrainingModel]()
                for trainingModel in trainingCardEntity.relationship?.allObjects as! [TrainingEnity] {
                    trainingModelList.append(TrainingModel(id: trainingModel.id ?? UUID(),
                                                           code: trainingModel.code ?? "",
                                                           value: trainingModel.value ?? "",
                                                           series: trainingModel.series,
                                                           repetition: trainingModel.repetition,
                                                           relax: trainingModel.relax,
                                                           addRepetition: trainingModel.addRepetition,
                                                           addWeigth: trainingModel.addWeigth))
                }
                trainingCardModelList.append(TrainingCardModel(id: trainingCardEntity.id ?? UUID(),
                                                               title: trainingCardEntity.title ?? "",
                                                               type: trainingCardEntity.type ?? "",
                                                               trainings: trainingModelList))
            }
            return trainingCardModelList
        } catch {
            print(error)
            return []
        }
    }
}
