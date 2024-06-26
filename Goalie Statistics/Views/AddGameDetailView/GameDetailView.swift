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
                        
                        StatBubbleView(title: "Shots", stat: String(goalie.shots), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        
                        StatBubbleView(title: "Saves", stat: String(goalie.saves), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        
                        StatBubbleView(title: "Save %", stat: "\(String(format: "%.1f", goalie.savePercentage * 100))", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        
                        StatBubbleView(title: "Goals", stat: String(goalie.goals), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        
                        
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
                        ForEach(goalie.games.sorted(by: { u1, u2 in u1.date > u2.date}))
                        {game in
                        GameUpdateView(game: game)
                                .onTapGesture {
                                }
                                .onLongPressGesture{
                                    self.goalieUpdate = game
                                }
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
            let isEdit = goalieUpdate.opponent.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            AddGameView(goalie: goalie, goalieUpdate: goalieUpdate, isEditMode: isEdit)
                .presentationDetents([.fraction(0.50)])
            
        }
        
    }
}

