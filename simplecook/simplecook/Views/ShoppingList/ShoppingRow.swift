//
//  ShoppingRow.swift
//  simplecook
//
//  Created by Conor Thorne on 22/02/2021.
//

import SwiftUI

struct ShoppingRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            Image(recipe.imageName)
                .resizable()
                .scaledToFit()
                .frame(width:75, height:100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                
            
            Text(recipe.name)
                        
        }
        .offset(x:-75)
        .frame(width:340, height:50)
        .padding()
        .border(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.white, lineWidth: 1))
        .shadow(radius:7)
        
        
    }
    
}

struct ShoppingRow_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    
    
    static var previews: some View {
        Group{
            ShoppingRow(recipe: recipes[0])
            ShoppingRow(recipe: recipes[1])
        }
        //.previewLayout(.fixed(width:300, height:70))
        // previewLayout modifier adjusted to represent a row in a list
        
    }
}
