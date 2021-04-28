//
//  ShoppingRow.swift
//  simplecook
//
//  Created by Conor Thorne on 22/02/2021.
//

import SwiftUI

struct ShoppingRow: View {
    var recipe : MyShoppingData
    @Binding var shoppingData : [MyShoppingData]
    var body: some View {
        VStack(alignment: .leading){
            CheckList(ingredients : recipe.ingredients, recipe: recipe, shoppingData: $shoppingData)
        }
        .frame(width: 370, height: 470)
        .padding()
    }
}

struct ShoppingRow_Previews: PreviewProvider {
    static var shoppinglist = ModelData().shoppinglist
    static var previews: some View {
        Group{
            ShoppingRow(recipe: MyShoppingData.data[0], shoppingData: .constant(MyShoppingData.data))
        }
    }
}
