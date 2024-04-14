//
//  AddGoalieView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/30/24.
//

import SwiftUI
import SwiftData
import TelemetryClient


struct AddGoalieView: View {
    
    // create an environment property to dismiss a page
    @Environment(\.dismiss) private var dismiss
    
    // create an environment property to being able to save data
    @Environment(\.modelContext) private var context
    
    
    // creates an instance of a Goalie
    var goalie: Goalie
    var isEditMode: Bool
    
    // Binding property for the goalies name
    @State private var goalieName: String = ""
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            // set the page background to sky blue
            Color.skyBlue
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                // sets the title of the display
                Text(isEditMode ? "Edit Goalie" : "Add Goalie")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack{
                    // create a textfield telling the user to type the new Goalies name
                    // the field is binded using the variable goalie name
                    TextField ("Goalie Name", text: $goalieName)
                        .textFieldStyle(.roundedBorder)
                    Button (isEditMode ? "Save" : "Add") {
                        if isEditMode {
                            goalie.name = goalieName
                        }
                        else {
                            //saving the new goalies name
                            // 1. set the goalie name obtained in the textField
                            
                            goalie.name = goalieName
                            
                            //save the goalie
                            context.insert(goalie)
                            TelemetryManager.send("added new goalie")
                        }
                        // dismiss the page
                            
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.headline)
                    .disabled(goalieName.trimmingCharacters(in: .whitespacesAndNewlines) == "")
                    
                    if isEditMode {
                        //show delete button
                        Button ("Delete") {
                            //show confirmation dialog
                            showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Are you sure you want to delete the goalie and all their games?", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Yes, delete goalie") {
                // Delete goalie from swift data
                context.delete(goalie)
                dismiss()
            }
        }
        .onAppear{
            goalieName = goalie.name
        }
    }
}


