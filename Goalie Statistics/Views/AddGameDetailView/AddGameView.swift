//
//  AddGameView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 4/1/24.
//

import SwiftUI

struct AddGameView: View {
    // create an environment property to dismiss a page
    @Environment(\.dismiss) private var dismiss
    
    // create an environment property to being able to save data
    @Environment(\.modelContext) private var context
    
    // creates an instance of a Goalie
    var goalie: Goalie
    var goalieUpdate: GoalieUpdate
    var isEditMode: Bool
    
    @State private var opponent: String = ""
    @State private var shots = 0
    @State private var goals = 0
    @State private var saves = 0
    @State private var savePercentage = 0.0
    @State private var showConfirmation = false
    
    
    
    var body: some View {
        ZStack {
            // set the page background to sky blue
            Color.skyBlue
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                // sets the title of the display
                Text(isEditMode ? "Edit Game" : "New Game")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                
                    // create a textfield telling the user to type the new Goalies name
                    // the field is binded using the variable goalie name
                    TextField ("Opponent", text: $opponent)
                        .textFieldStyle(.roundedBorder)
                
                Spacer()
                ZStack (alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .opacity(0.7)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        
                        HStack{
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("Sky Blue"))
                                    .shadow(radius: 10, x:0, y:4 )
                                VStack {
                                    Text("Shots")
                                        .font(.captionText)
                                    Text(String(shots))
                                        .font(.featuredNumber)
                                        .bold()
                                }
                                .foregroundStyle(.white)
                            }
                            .frame(width: 60, height: 40)
                            .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                //subtract goals
                                if self.shots > 0 {
                                    self.shots -= 1
                                    calculatedSaves()
                                    calculateSavePct()
                                    
                                }
                                
                            }, label: {
                                ZStack{
                                    Circle()
                                        .frame(width: 45)
                                        .foregroundColor(.skyBlue)
                                        
                                    Image(systemName: "minus")
                                        .font(Font.featuredText)
                                        .foregroundStyle(.white)
                                }
                            })
                            .padding()
                            
                            Button(action: {
                                //add goal
                                self.shots += 1
                                calculatedSaves()
                                calculateSavePct()
                               
                                
                            }, label: {
                                ZStack{
                                    Circle()
                                        .frame(width: 45)
                                        .foregroundColor(.skyBlue)
                                        
                                    Image(systemName: "plus")
                                        .font(Font.featuredText)
                                        .foregroundStyle(.white)
                                }
                            })
                            .padding()

                        }
                    }
                }
                ZStack (alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .opacity(0.7)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        HStack{
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("Sky Blue"))
                                    .shadow(radius: 10, x:0, y:4 )
                                VStack {
                                    Text("Goals")
                                        .font(.captionText)
                                    Text(String(goals))
                                        .font(.featuredNumber)
                                        .bold()
                                }
                                .foregroundStyle(.white)
                            }
                            .frame(width: 60, height: 40)
                            
                            .padding()
                            
                            
                            Spacer()
                            
                            Button(action: {
                                //subtract goals
                                if self.goals > 0  {
                                    self.goals -= 1
                                    calculatedSaves()
                                    calculateSavePct()
                                }
                            }, label: {
                                ZStack{
                                    Circle()
                                        .frame(width: 45)
                                        .foregroundColor(.skyBlue)
                                        
                                    Image(systemName: "minus")
                                        .font(Font.featuredText)
                                        .foregroundStyle(.white)
                                }
                            })
                            .padding()
                            
                            Button(action: {
                                //add goal
                                self.goals += 1
                                calculatedSaves()
                                calculateSavePct()
                               
                                
                            }, label: {
                                ZStack{
                                    Circle()
                                        .frame(width: 45)
                                        .foregroundColor(.skyBlue)
                                        
                                    Image(systemName: "plus")
                                        .font(Font.featuredText)
                                        .foregroundStyle(.white)
                                }
                            })
                            .padding()
                           
                                
                            
                        }
                    }
                }
                
                ZStack (alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .opacity(0.7)
                    
                    VStack (alignment: .center, spacing: 10) {
                        HStack {
                            
                            Spacer()
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("Sky Blue"))
                                    .shadow(radius: 10, x:0, y:4 )
                                VStack (alignment: .center){
                                    Text("Save %")
                                        .font(.bigHeadline)
                                    Text("\(String(format: "%.1f", (savePercentage * 100)))%")
                                        .font(.bigHeadline)
                                        .bold()
                                }
                                .foregroundStyle(.white)
                            }
                            .frame(width: 250, height: 45)
                            .padding()
                          Spacer()
                            
                        }
                    }
                }
                HStack (alignment: .center) {
                    Spacer()
                    Button(isEditMode ? "Save" : "Add Game") {
                        
                        goalieUpdate.opponent = opponent
                        goalieUpdate.shots = shots
                        goalieUpdate.goals = goals
                        goalieUpdate.saves = saves
                        goalieUpdate.savePercentage = savePercentage
                        
                        if !isEditMode {
                            goalie.games.insert(goalieUpdate, at: 0)
                        }

                        dismiss()
                    }
                    
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    Spacer()
                    if isEditMode {
                        Button("Delete") {
                            //show confirmation dialog
                            showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                
               
            }
            .padding(.horizontal)
            .padding(.top)
            
           
        }
        .confirmationDialog("Are you sure you want to delete this game?", isPresented: $showConfirmation) {
            Button("Yes, delete the game") {
                goalie.games.removeAll {u in
                    u.id == goalieUpdate.id
                }
                dismiss()
            }
        }
        .onAppear{
            opponent = goalieUpdate.opponent
            shots = goalieUpdate.shots
            saves = goalieUpdate.saves
            goals = goalieUpdate.goals
            savePercentage = goalieUpdate.savePercentage
        }
    }
    func calculatedSaves() {
        saves = shots - goals
    
    }
    
    func calculateSavePct() {
        
        if shots <= goals {
            savePercentage = 0.0
        } else if shots > goals {
            savePercentage = Double(saves) / Double(shots)
        }
    }
    
}



