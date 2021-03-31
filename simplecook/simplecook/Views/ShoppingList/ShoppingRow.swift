//
//  ShoppingRow.swift
//  simplecook
//
//  Created by Conor Thorne on 22/02/2021.
//

import SwiftUI

struct ShoppingRow: View {
    
    var recipe : Recipe

    var body: some View {
        VStack(alignment: .leading){
            CheckList(ingredients : recipe.ingredients, recipe: recipe)
        }
        .frame(width: 370, height: 470)
    }
}

struct ShoppingRow_Previews: PreviewProvider {
    static var shoppinglist = ModelData().shoppinglist

    static var previews: some View {
        Group{
            ShoppingRow(recipe: shoppinglist[0])
        }
    }
}
