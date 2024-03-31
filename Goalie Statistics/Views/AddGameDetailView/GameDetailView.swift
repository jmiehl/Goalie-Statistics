//
//  GameDetailView.swift
//  Goalie Statistics
//
//  Created by Joe Miehl on 3/31/24.
//

import SwiftUI

struct GameDetailView: View {
    
    //Environment instance to dismiss screen when hitting back button
    @Environment(\.dismiss) private var dismiss
    
    // add instance of the goalie to access the goalie information
    var goalie: Goalie
    
    var body: some View {
        
        VStack{
            Text(goalie.name)
                .navigationBarBackButtonHidden(true)
            Button("BACK") {
                dismiss()
            }
        }
    }
}

#Preview {
    GameDetailView(goalie: Goalie())
}
