//
//  DateHelper.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 4/5/24.
//

import Foundation

struct DateHelper {
    static func gameUpdateDate (inputDate: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        
        return df.string(from: inputDate)
    }
}
