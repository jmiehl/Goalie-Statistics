//
//  GameUpdateView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/31/24.
//

import SwiftUI

struct GameUpdateView: View {
    var game: GoalieUpdate
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x:0, y: 4)
            
            
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text(DateHelper.gameUpdateDate(inputDate: game.date))
                        .padding(7)
                        
                    Spacer()
                    Text(game.opponent)
                        .padding(7)
                        
                }
                .background(.skyBlue)
                
                HStack (alignment: .center, spacing: 13) {
                    Spacer()
                    StatBubbleView(title: "Shots", stat: String(game.shots), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Saves", stat: String(game.saves), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Save %", stat: "\(String(format: "%.1f", game.savePercentage * 100))", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Goals", stat: String(game.goals), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    Spacer()
                    
                }
                .padding(.bottom, 10)
                .padding(.top, 3)
            }
            
            .foregroundStyle(.white)
            .font(.featuredText)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
    }
}


