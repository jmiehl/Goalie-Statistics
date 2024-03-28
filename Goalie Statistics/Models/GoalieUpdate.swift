//
//  GoalieUpdate.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/28/24.
//

import Foundation
import SwiftData

@Model
class GoalieUpdate: Identifiable {
    
    @Attribute(.unique) var id: String
    var opponent = ""
    var date = Date()
    var shots = 0
    var saves = 0
    var goals = 0
    var savePercentage = 0.0
    var goalie: Goalie?
    
    init() {
        id = UUID().uuidString
    }
}
