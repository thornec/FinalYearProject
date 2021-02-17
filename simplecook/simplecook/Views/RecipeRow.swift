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
            recipe.image
                .resizable()
                .frame(width:50, height:50)
            Text(recipe.name)
            
            Spacer()
            
            // check if recipe is saved
            if recipe.isSaved {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            
        }
    }
    
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            RecipeRow(recipe: recipes[0])
            RecipeRow(recipe: recipes[1])
        }
        .previewLayout(.fixed(width:300, height:70))
        // previewLayout modifier adjusted to represent a row in a list
        
    }
}

