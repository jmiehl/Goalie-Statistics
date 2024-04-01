//
//  GameUpdateView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/31/24.
//

import SwiftUI

struct GameUpdateView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x:0, y: 4)
            
            
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text("Saturday, September 15, 2023")
                        .padding(7)
                        
                    Spacer()
                    Text("vs. Team Philadelphia")
                        .padding(7)
                        
                }
                .background(.skyBlue)
                
                HStack (alignment: .center, spacing: 13) {
                    Spacer()
                    StatBubbleView(title: "Shots", stat: "30", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Saves", stat: "28", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Save %", stat: "93.3", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Goals", stat: "2", startColor: Color("Navy"), endColor: Color("Sky Blue"))
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

#Preview {
    GameUpdateView()
}
