//
//  StorageManager.swift
//  CoreDemoApp
//
//  Created by Евгения Аникина on 20.04.2022.
//

import CoreData

class StorageManager {
    static let share = StorageManager()
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataManager")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}



