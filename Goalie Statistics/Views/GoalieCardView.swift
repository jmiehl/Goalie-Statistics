//
//  GoalieCardView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/29/24.
//

import SwiftUI

struct GoalieCardView: View {
    
    // creates an instance of goalie
    var goalie: Goalie
    
    var body: some View {
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
            VStack (alignment: .leading, spacing: 10
            ) {
                // display the goalie name from Goalie
                Text(goalie.name)
                    .font(Font.bigHeadline)
                    .foregroundStyle(.white)
                
                HStack(alignment: .center, spacing: 13) {
                    Spacer()
                    
                    StatBubbleView(title: "Shots", stat: "30", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Saves", stat: "28", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Save %", stat: "93.3", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Goals", stat: "2", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    Spacer()
                    
                    
                    
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    GoalieCardView(goalie: Goalie())
}
