//
//  RemoveItem.swift
//  simplecook
//
//  Created by Conor Thorne on 03/03/2021.
//

import SwiftUI

// view for removing an item from the shopping list
struct RemoveItem: View {
    @Binding var recipes : [MyShoppingData]
    var recipe : MyShoppingData
    var body: some View {
        // add to shopping list button
        Button(action: {
            // find index of element to be removed
            let index = findIndex(shoppinglist : MyShoppingData.data, recipe_name: recipe.title)
            // remove item at index from list
            recipes.remove(at:index)
            
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
func findIndex(shoppinglist : [MyShoppingData], recipe_name : String) -> Int{
    
    var count = 0
    
    // loop through list and find element equal to name
    for recipe in shoppinglist {
        if(recipe.title == recipe_name){
            return count
        }
        else {
            count+=1
        }
    }
    return count
}

struct RemoveItem_Previews: PreviewProvider {
    
    static var previews: some View {
        RemoveItem(recipes : .constant(MyShoppingData.data), recipe:MyShoppingData.data[0])
    }
}
