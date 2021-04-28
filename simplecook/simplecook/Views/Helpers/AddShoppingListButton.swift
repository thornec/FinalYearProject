//
//  AddShoppingListButton.swift
//  simplecook
//
//  Created by Conor Thorne on 03/03/2021.
//

import SwiftUI

// button for adding an item to the shopping list
struct AddShoppingListButton: View {
    @Binding var shoppinglist : [MyShoppingData]    // shopping list
    @State private var showingAlert = false         // alert

    // shopping list details
    var title : String
    var category : String
    var ingredients : [String]
    var servings : [Int]
    var imageName : String
        
    var body: some View {
        // button
        Button(action: {
            // create new shopping list item
            let new = (MyShoppingData(title:title, category:category, ingredients:ingredients, servings:servings, imageName:imageName))
            shoppinglist.append(new)    // add to list
            showingAlert = true         // alert user to sucess
        }){
            // button image
            VStack{
                Image(systemName: "cart.badge.plus")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius:9)
                // button text
                Text("add to shop list")
                    .font(.system(size:15.0))
                    .foregroundColor(.blue)
            }
        }
        // alert screen cover
        .alert(isPresented: $showingAlert) {
                    Alert(title: Text("added to shopping list!"), message: Text(""), dismissButton: .default(Text("got it!")))
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
