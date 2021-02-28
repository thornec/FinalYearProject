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
            HStack {
                
                ShoppingImage(recipe: recipe)
                
                Text(recipe.name)
                                        
            }
            .offset(x:-75)
            .frame(width:340, height:30)
            .padding()
            .border(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.white, lineWidth: 1))
            .shadow(radius:7)
            
            CheckList(ingredients : recipe.ingredients)
            
        }
        .frame(width: 350, height: 225)
        //.border(Color.black)
    }
    
}

struct ShoppingRow_Previews: PreviewProvider {
    //static var shoppinglist = ModelData().shoppinglist
    static var shoppinglist = ModelData().shoppinglist

    
    static var previews: some View {
        Group{
            ShoppingRow(recipe: shoppinglist[0])
            ShoppingRow(recipe: shoppinglist[1])

        }
        //.previewLayout(.fixed(width:300, height:70))
        // previewLayout modifier adjusted to represent a row in a list
        
    }
}
