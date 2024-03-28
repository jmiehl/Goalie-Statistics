//
//  Goalie.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/28/24.
//

import Foundation
import SwiftData

@Model

class Goalie: Identifiable {
    @Attribute(.unique) var id: String
    var name = ""
    var gameDate = Date()
    var games: [GoalieUpdate] = [GoalieUpdate]()
    @Relationship(deleteRule: .cascade, inverse: \GoalieUpdate.goalie)
    
    
    
    init() {
        id = UUID().uuidString
    }
}
