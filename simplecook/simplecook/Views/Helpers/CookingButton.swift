//
//  CookingButton.swift
//  simplecook
//
//  Created by Conor Thorne on 19/02/2021.
//

import SwiftUI

struct CookingButton: View {
    var body: some View {
        VStack{
            Button(action: {}) {
                HStack{
                    // start cooking button
                    Text("Start Cooking!")
                        .padding(.horizontal)                      // creates wide rectangle
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        
                    
                    // cooking image
                    Image(systemName: "play")                      // play button
                    
                }
                .padding()
            }
            .frame(width:350, height:100)
            .background(Color.white)
            .foregroundColor(.black)        // sets color of text
            .cornerRadius(20)               // rounds corners
            .shadow(radius:9)

        }

    }
}

struct CookingButton_Previews: PreviewProvider {
    static var previews: some View {
        CookingButton()
    }
}
