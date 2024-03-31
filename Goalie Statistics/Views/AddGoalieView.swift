//
//  AddGoalieView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/30/24.
//

import SwiftUI
import SwiftData


struct AddGoalieView: View {
    
    // create an environment property to dismiss a page
    @Environment(\.dismiss) private var dismiss
    
    // create an environment property to being able to save data
    @Environment(\.modelContext) private var context
    
    // creates an instance of a Goalie
    var goalie: Goalie
    
    // Binding property for the goalies name
    @State var goalieName: String = ""
    
    var body: some View {
        ZStack {
            // set the page background to sky blue
            Color.skyBlue
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                // sets the title of the display
                Text("New Goalie")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack{
                    // create a textfield telling the user to type the new Goalies name
                    // the field is binded using the variable goalie name
                    TextField ("Goalie Name", text: $goalieName)
                        .textFieldStyle(.roundedBorder)
                    Button ("Save") {
                        //saving the new goalies name
                        // 1. set the goalie name obtained in the textField
                        
                        goalie.name = goalieName
                        
                        //save the goalie
                        context.insert(goalie)
                        
                        // dismiss the page
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.headline)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}


