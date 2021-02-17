//
//  ContentView.swift
//  simplecook
//
//  Created by Conor Thorne on 16/02/2021.
//

import SwiftUI

// content and layout
struct ContentView: View {
    var body: some View {
        VStack(){
            
            // import recipe image component
            RecipeImage()
            
            Spacer()
                

            Text("Poached Eggs")
                .font(.title)
                .padding(5)
            
            Divider()
            
            HStack {
                Text("Cook Time")
                    
                Spacer()
                    
                Text("€ Price")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding(20)
                
            
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.white, lineWidth: 4))
                .shadow(radius:7)
                
            Divider()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
