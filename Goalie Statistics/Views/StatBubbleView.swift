//
//  StatBubbleView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/29/24.
//

import SwiftUI

struct StatBubbleView: View {
    var title: String
    var stat: String
    var startColor: Color
    var endColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(radius: 10, x:0, y:4 )
            VStack {
                Text(title)
                    .font(.captionText)
                Text(stat)
                    .font(.featuredNumber)
                    .bold()
            }
            .foregroundStyle(.white)
        }
        .frame(width: 60, height: 40)
    }
}

#Preview {
    StatBubbleView(title: "Shots", stat: "35", startColor: Color("Navy"), endColor: Color("Blue"))
}
