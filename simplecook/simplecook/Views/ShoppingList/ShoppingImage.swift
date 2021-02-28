//
//  ShoppingImage.swift
//  simplecook
//
//  Created by Conor Thorne on 24/02/2021.
//

import SwiftUI

struct ShoppingImage: View {
    
    var recipe : Recipe

    var body: some View {
        Image(recipe.imageName)
            .resizable()
            .scaledToFit()
            .frame(width:50, height:50)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }
}

struct ShoppingImage_Previews: PreviewProvider {
    
    static var shoppinglist = ModelData().shoppinglist

    
    static var previews: some View {
        ShoppingImage(recipe: shoppinglist[0])
    }
}
