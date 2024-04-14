//
//  StatHelper.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 4/2/24.
//

import Foundation
import SwiftUI

struct StatHelper {
    
    static func gameAdded (goalie: Goalie, goalieUpdate: GoalieUpdate) {
        // Change shots
        goalie.shots += goalieUpdate.shots
        
        // Change goals
        goalie.goals += goalieUpdate.goals
        
        // Change saves
        goalie.saves += goalieUpdate.saves
        
        // Change Save Perecentage
        goalie.savePercentage = Double(goalie.saves) / Double(goalie.shots)
        
    }
    
    static func gameDeleted (goalie: Goalie, goalieUpdate: GoalieUpdate) {
        // Change shots
        goalie.shots -= goalieUpdate.shots
        
        // Change goals
        goalie.goals -= goalieUpdate.goals
        
        // Change saves
        goalie.saves -= goalieUpdate.saves
        
        // Change Save Perecentage
        goalie.savePercentage = Double(goalie.saves) / Double(goalie.shots)
        
        
        
    }
    
    static func gameEdited (goalie: Goalie, shotsDifference: Int, saveDifference: Int, goalsDifference: Int) {
        
        // change hours
        goalie.shots += shotsDifference
        
        // change goales
        goalie.goals += goalsDifference
        
        // change saves
        goalie.saves += saveDifference
        
        // update save percentage
        goalie.savePercentage = Double(goalie.saves) / Double(goalie.shots)
        
    }
}
