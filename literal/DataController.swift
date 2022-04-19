//
//  DataController.swift
//  literal
//
//  Created by diayan siat on 19/04/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Literal")
    init() {
        container.loadPersistentStores(completionHandler: { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        })
    }
}
