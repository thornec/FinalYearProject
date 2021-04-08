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
            //modelData.shoppinglist.append(recipe)
        }){
            Image(systemName: "cart.badge.plus")
                .font(.largeTitle)
                .padding()
                .background(Color.white)
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)
        }
    }
}

struct AddShoppingListButton_Previews: PreviewProvider {
    
    static var recipes = ModelData().recipes

    
    static var previews: some View {
        AddShoppingListButton(recipe : recipes[0]).environmentObject(ModelData())
    }
}
