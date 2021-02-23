//
//  ShoppingRow.swift
//  simplecook
//
//  Created by Conor Thorne on 22/02/2021.
//

import SwiftUI

struct ShoppingRow: View {
    var recipe: ShoppingList
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:50, height:50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    
                
                Text(recipe.name)
                                        
            }
            .offset(x:-75)
            .frame(width:340, height:30)
            .padding()
            .border(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.white, lineWidth: 1))
            .shadow(radius:7)
            
            
            ForEach(recipe.ingredients, id: \.self){ ingredient in
                HStack{
                    Text(ingredient)
                    
                    
                }
                Divider()
            }
            .padding()
            
            
            
            
                
                
        }
        
        
        
    }
    
}

struct ShoppingRow_Previews: PreviewProvider {
    //static var shoppinglist = ModelData().shoppinglist
    
    
    static var previews: some View {
        Group{
            ShoppingRow(recipe: shoppinglist[0])
        }
        //.previewLayout(.fixed(width:300, height:70))
        // previewLayout modifier adjusted to represent a row in a list
        
    }
}
