//
//  GameDetailView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/31/24.
//

import SwiftUI

struct GameDetailView: View {
    
    @State private var goalieUpdate: GoalieUpdate?
    
    //Environment instance to dismiss screen when hitting back button
    @Environment(\.dismiss) private var dismiss
    
    // add instance of the goalie to access the goalie information
    var goalie: Goalie
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color.navy, Color.skyBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            LinearGradient(colors: [Color("Tiffany Teal"), Color("Tiffany Teal")], startPoint: .top, endPoint: .bottom)
                .frame(width: 1)
                .padding(.leading, -145)
            
            
            VStack {
                //Header
                VStack (alignment: .leading, spacing: 13) {
                    Text(goalie.name)
                        .font(.screenHeading)
                    
                    
                    HStack(alignment: .center, spacing: 13) {
                        Spacer()
                        
                        StatBubbleView(title: "Shots", stat: "30", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        
                        StatBubbleView(title: "Saves", stat: "28", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        
                        StatBubbleView(title: "Save %", stat: "93.3", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        
                        StatBubbleView(title: "Goals", stat: "2", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        
                        
                        Spacer()
                        
                    }
                }
                .foregroundStyle(.white)
                .padding()
                .background {
                    Color.black
                        .opacity(0.7)
                        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                        .ignoresSafeArea()
                }
                
                // GAMES
                ScrollView (showsIndicators: false) {
                    VStack {
                        ForEach(goalie.games) {game in
                        GameUpdateView(game: game)
                        }
                        
                    }
                    .padding()
                    .padding(.bottom, 80)
                }
            }
            
            VStack{
                Spacer()
                
                HStack{
                    Button(action: {
                        //Todo: add game
                        
                        self.goalieUpdate = GoalieUpdate()
                        
                    }, label: {
                        ZStack{
                            Circle()
                                .frame(width: 65)
                                .foregroundColor(.skyBlue)
                                
                            Text("Add Game")
                                .font(Font.featuredText)
                                .foregroundStyle(.white)
                        }
                    })
                    .padding([.leading, .top])
                    
                    
                    Spacer()
                    
                    Button("Back") {
                        dismiss()
                    }
                    .font(Font.featuredText)
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.white)
                    .tint(.skyBlue)
                    .padding([.trailing, .top])
                }
                .background {
                    Color(.black)
                        .opacity(0.7)
                        .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                        .ignoresSafeArea()
                }
            }
           
            
        }
        .navigationBarBackButtonHidden(true)
        .sheet(item: $goalieUpdate) { goalieUpdate in
            AddGameView(goalie: goalie, goalieUpdate: goalieUpdate)
                .presentationDetents([.fraction(0.50)])
            
        }
        
    }
}

