//
//  ContentView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/28/24.
//

import SwiftUI

struct GoalieListView: View {
    var body: some View {
        ZStack {
            // designs the app background within a ZStack
            LinearGradient(colors: [Color.navy, Color.skyBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack (alignment: .leading) {
                Text("Goalies Statistics")
                    .font(Font.screenHeading)
                    .foregroundStyle(.white)
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading, spacing: 26){
                        GoalieCardView()
                        GoalieCardView()
                        GoalieCardView()
                        GoalieCardView()
                        GoalieCardView()
                        GoalieCardView()
                       
                    }
                }
                
              
            }
            .padding()
            
            VStack{
            
                Spacer()
                
                HStack{
                    
                    Button(action: {
                        // Todo
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 65)
                                .foregroundColor(.black)
                            Text("Add Goalie")
                                .font(Font.featuredText)
                                .foregroundStyle(.white)
                            
                        }
                    })
                 Spacer()
                }
            }
            .padding(.leading)
        }
            
    }
        
}

#Preview {
    GoalieListView()
}
