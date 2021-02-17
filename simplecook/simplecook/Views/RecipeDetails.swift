//
//  RecipeDetails.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import SwiftUI

struct RecipeDetails: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView{
            
            // import recipe image component
            RecipeImage(image: recipe.image)
                .ignoresSafeArea(edges: .top)
                
            VStack(alignment: .leading){
                
                // recipe title
                Text(recipe.name)
                    .font(.title)
                    .padding(5)
                
                // border
                Divider()
                
                // recipe price and cook time
                HStack {
                    Text(recipe.cooktime)
                        
                    Spacer()
                        
                    Text(recipe.price)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                    
                //ingredients
                Text("ingredients")
                    .font(.title)
                Text(recipe.ingredients)
                    .font(.subheadline)
                //method
                Text("method")
                    .font(.title)
                Text(recipe.method)
                    .font(.subheadline)
            }
            .padding()
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(recipe: recipes[0])
    }
}
