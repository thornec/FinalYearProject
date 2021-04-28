//
//  ShoppingImage.swift
//  simplecook
//
//  Created by Conor Thorne on 24/02/2021.
//

import SwiftUI

// view for shopping list item image
struct ShoppingImage: View {
    var recipe : MyShoppingData
    var body: some View {
        Image(recipe.imageName)
            .resizable()
            .scaledToFit()
            .frame(width:70, height:70)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }
}

struct ShoppingImage_Previews: PreviewProvider {
    
    static var previews: some View {
        ShoppingImage(recipe: MyShoppingData.data[0])
    }
}
