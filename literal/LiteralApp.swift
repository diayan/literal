//
//  literalApp.swift
//  literal
//
//  Created by diayan siat on 19/04/2022.
//

import SwiftUI

@main
struct LiteralApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
