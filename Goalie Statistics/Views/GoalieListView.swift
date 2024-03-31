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
                        ForEach (goalie) {g in
                            GoalieCardView(goalie: g)
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
        .sheet(item: $newGoalie) { goalie in
            AddGoalieView(goalie: goalie)
                .presentationDetents([.fraction(0.20)])
            
        }
    }
}
    #Preview {
       GoalieListView()
    }

