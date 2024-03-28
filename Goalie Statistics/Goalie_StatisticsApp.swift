//
//  Goalie_StatisticsApp.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/28/24.
//

import SwiftUI
import SwiftData

@main
struct Goalie_StatisticsApp: App {
    var body: some Scene {
        WindowGroup {
            GoalieListView()
                .modelContainer(for: [Goalie.self, GoalieUpdate.self])
        }
    }
}
