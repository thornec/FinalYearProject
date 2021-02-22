//
//  RecipeRow.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            Image(recipe.imageName)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .frame(width:100, height:100)
            Text(recipe.name)
            
            Spacer()
            
            // check if recipe is saved
            if recipe.isSaved {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            
        }
        .frame(width:300, height:100)
        .padding()
        .border(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.white, lineWidth: 2))
        .shadow(radius:7)
        //.shadow(radius:7)
    }

}

struct RecipeRow_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    
    
    static var previews: some View {
        Group{
            RecipeRow(recipe: recipes[0])
            RecipeRow(recipe: recipes[1])
        }
        //.previewLayout(.fixed(width:300, height:70))
        // previewLayout modifier adjusted to represent a row in a list
        
    }
}

