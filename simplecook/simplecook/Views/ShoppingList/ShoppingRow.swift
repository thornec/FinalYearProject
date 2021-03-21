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
            .frame(width:330, height:70)
            .padding(.horizontal)                      // creates wide rectangle
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .foregroundColor(.black)                    // sets color of text
            .cornerRadius(20)                           // rounds corners
            .shadow(radius:9)
            .padding()
            
            CheckList(ingredients : recipe.ingredients)
            
            RemoveItem(recipe: recipe)
                .offset(x:290, y:-20)
            
        }
        .frame(width: 370, height: 470)
        //.border(Color.black)
    }
    
}

struct ShoppingRow_Previews: PreviewProvider {
    //static var shoppinglist = ModelData().shoppinglist
    static var shoppinglist = ModelData().shoppinglist

    
    static var previews: some View {
        Group{
            ShoppingRow(recipe: shoppinglist[0])

        }
        //.previewLayout(.fixed(width:300, height:70))
        // previewLayout modifier adjusted to represent a row in a list
        
    }
}
