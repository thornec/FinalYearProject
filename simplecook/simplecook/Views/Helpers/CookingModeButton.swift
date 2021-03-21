//
//  CookingModeButton.swift
//  simplecook
//
//  Created by Conor Thorne on 19/03/2021.
//

import SwiftUI

struct CookingModeButton: View {
    
    var image : String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .frame(width:300,height:400)
                .scaledToFit()
                .padding(.horizontal)                      // creates wide rectangle
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .foregroundColor(.black)                    // sets color of text
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)
                .padding()
        }
    }
}

struct CookingModeButton_Previews: PreviewProvider {
    static var previews: some View {
        CookingModeButton(image : "step1")
    }
}
