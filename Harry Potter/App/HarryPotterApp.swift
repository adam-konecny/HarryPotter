//
//  HarryPotterApp.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import SwiftUI

@main
struct HarryPotterApp: App {
    @State private var services = Services(configuration: .production)
    
    var body: some Scene {
        WindowGroup {
            BaseTabView(services: services)
        }
    }
}
