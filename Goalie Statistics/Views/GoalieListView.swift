//
//  ContentView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/28/24.
//

import SwiftUI
import SwiftData

struct GoalieListView: View {
    
    
    // variable to create a new goalie instance
    @State private var newGoalie: Goalie?
    
    //query the saved goalies
    @Query private var goalie: [Goalie]
    @State private var selectedGoalie: Goalie?
    
    var body: some View {
        
        NavigationStack{
            
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
                            
                            ForEach (goalie) {g in
                                
                                GoalieCardView(goalie: g)
                                    .onTapGesture {
                                    selectedGoalie = g
                                }
                                    .onLongPressGesture {
                                        newGoalie = g
                                    }
                                    
                                
                               /*
                                NavigationLink {
                                    GameDetailView(goalie: g)
                                } label: {
                                    GoalieCardView(goalie: g)
                                        .onLongPressGesture {
                                            newGoalie = g
                                        }
                                }
                                .buttonStyle(.plain)
                                */
                            }
                        }
                    }
                    
                    
                }
                .padding()
                
                VStack{
                    
                    Spacer()
                    
                    HStack{
                        
                        Button(action: {
                            // create new goalie
                            self.newGoalie = Goalie()
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
            .navigationDestination(item: $selectedGoalie) { goalie in
                GameDetailView(goalie: goalie)
            }
            .sheet(item: $newGoalie) { goalie in
                
                let isEdit = goalie.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
                AddGoalieView(goalie: goalie, isEditMode: isEdit)
                    .presentationDetents([.fraction(0.20)])
                
            }
        }
    }
}
    #Preview {
       GoalieListView()
    }

