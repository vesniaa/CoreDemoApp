//
//  StorageManager.swift
//  CoreDemoApp
//
//  Created by Евгения Аникина on 20.04.2022.
//

import CoreData

class StorageManager {
    static let shared = StorageManager()
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataManager")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
        
        private init() {
            viewContext = persistentContainer.viewContext
        }

        func fetchData(completion: (Result<[Task], Error>) -> Void) {
            let fetchRequest = Task.fetchRequest()
            
            do {
                let tasks = try viewContext.fetch(fetchRequest)
                completion(.success(tasks))
            } catch let error {
                completion(.failure(error))
            }
        }
}
        






