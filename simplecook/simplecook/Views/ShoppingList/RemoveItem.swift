//
//  RemoveItem.swift
//  simplecook
//
//  Created by Conor Thorne on 03/03/2021.
//

import SwiftUI

struct RemoveItem: View {
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    var recipe : Recipe
    
    var body: some View {
        
        // add to shopping list button
        Button(action: {
            
            // find index of element to be removed
            let index = findIndex(shoppinglist : modelData.shoppinglist, recipe_name: recipe.name)
            // remove item at index from list
            modelData.shoppinglist.remove(at:index)
            
        }){
            Image(systemName: "trash")
                .frame(width:40, height:70)
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


// used to find index of recipe item to be deleted
func findIndex(shoppinglist : [Recipe], recipe_name : String) -> Int{
    
    var count = 0
    
    // loop through list and find element equal to name
    for recipe in shoppinglist {
        if(recipe.name == recipe_name){
            return count
        }
        else {
            count+=1
        }
    }
    
    return count
    
}

struct RemoveItem_Previews: PreviewProvider {
    
    static let recipe = ModelData().recipes[0]

    static var previews: some View {
        RemoveItem(recipe : recipe).environmentObject(ModelData())
    }
}
