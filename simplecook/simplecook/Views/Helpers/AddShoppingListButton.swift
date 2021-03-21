//
//  AddShoppingListButton.swift
//  simplecook
//
//  Created by Conor Thorne on 03/03/2021.
//

import SwiftUI

struct AddShoppingListButton: View {
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    var recipe : Recipe
    
    var body: some View {
        
        Button(action: {
            modelData.shoppinglist.append(recipe)
        }){
            Text("add to shopping list")
                .padding(.horizontal)                      // creates wide rectangle
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(width:330, height:100)
                .background(Color.white)
                .foregroundColor(.black)                    // sets color of text
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)
                .padding()
        }
    }
}

struct AddShoppingListButton_Previews: PreviewProvider {
    
    static var recipes = ModelData().recipes

    
    static var previews: some View {
        AddShoppingListButton(recipe : recipes[0]).environmentObject(ModelData())
    }
}
