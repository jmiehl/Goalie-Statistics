//
//  StatHelper.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 4/2/24.
//

import Foundation
import SwiftUI

struct StatHelper {
    
    static func calculateSavePercentage(goalie: Goalie, goalieUpdate: GoalieUpdate ) {
        
        goalieUpdate.saves = goalieUpdate.shots - goalieUpdate.goals
    }
}
