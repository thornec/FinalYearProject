//
//  CookingButton.swift
//  simplecook
//
//  Created by Conor Thorne on 19/02/2021.
//

import SwiftUI

// view for large rectangle button
struct CookingButton: View {
    var string : String         // button text
    var body: some View {
        VStack{
            Text(string)
                .padding(.horizontal)                      // creates wide rectangle
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(width:310, height:100)
                .background(Color.white)
                .foregroundColor(.black)                    // sets color of text
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)
                .padding()
                .offset(y:-40)
        }
    }
}

struct CookingButton_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    static var previews: some View {
        CookingButton(string:recipes[0].name)
    }
}
