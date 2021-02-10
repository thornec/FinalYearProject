//
//  ContentView.swift
//  Landmarks
//
//  Created by Conor Thorne on 05/02/2021.
//

import SwiftUI

// describes view's content & layout
struct ContentView: View {
    var body: some View {
        VStack {
            // add map view
            MapView()
                .ignoresSafeArea(edges: .top)   // extend to top of screen
                .frame(height: 300) // set height
            
            // add circle image
            CircleImage()
                .frame(width: nil)
                .offset(y: -130)
                .padding(.bottom, -130) // adjust image to layer the map
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                    
                    Spacer()                        // expands to use all of space
                    
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive Text Goes Here:")
                
                
            }
            .padding()  // gives stacks space
            
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
