//
//  AddShoppingListButton.swift
//  simplecook
//
//  Created by Conor Thorne on 03/03/2021.
//

import SwiftUI

struct AddShoppingListButton: View {
    
    @Binding var shoppinglist : [MyShoppingData]
    
    var title : String
    var category : String
    var ingredients : [String]
    var servings : [Int]
    var imageName : String
        
    var body: some View {
        Button(action: {
            let new = (MyShoppingData(title:title, category:category, ingredients:ingredients, servings:servings, imageName:imageName))
            shoppinglist.append(new)
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
    
    static var recipe = MyRecipeModel.data[1]
    static var shoppinglist = ModelData().shoppinglist

    static var previews: some View {
        AddShoppingListButton(shoppinglist:.constant(ModelData().shoppinglist), title:recipe.title, category:recipe.categoryName, ingredients:recipe.ingredients, servings:recipe.servings, imageName:recipe.imageName)
    }
}
