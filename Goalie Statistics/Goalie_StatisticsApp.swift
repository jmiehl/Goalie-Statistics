//
//  Goalie_StatisticsApp.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/28/24.
//

import SwiftUI
import SwiftData
import TelemetryClient

@main
struct Goalie_StatisticsApp: App {
    var body: some Scene {
        WindowGroup {
            GoalieListView()
                .modelContainer(for: [Goalie.self, GoalieUpdate.self])
        }
    }
    
    init() {
            let configuration = TelemetryManagerConfiguration(
                appID: "FD1470A7-6F83-4AAA-B696-9AB82A44CBAA")
            TelemetryManager.initialize(with: configuration)
        
            TelemetryManager.send("applicationDidFinishLaunching")
        }
}
