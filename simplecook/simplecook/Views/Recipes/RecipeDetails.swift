//
//  RecipeDetails.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import SwiftUI
import iPages

struct RecipeDetails: View {
    @EnvironmentObject var modelData: ModelData
    var recipe: Recipe
    
    // compute index of input landmark by comparing it to model data
    var recipeIndex: Int {
        modelData.recipes.firstIndex(where: {
            $0.id == recipe.id
        })!
    }
    
    var body: some View {
        ScrollView{
            
            // import recipe image component
            RecipeImage(image: recipe.image)
                .ignoresSafeArea(edges: .top)
                
            VStack(alignment: .leading){
                HStack{
                    // recipe title
                    Text(recipe.name)
                        .font(.title)
                        .padding(10)
                        .foregroundColor(.primary)
                    SaveButton(isSet: $modelData.recipes[recipeIndex].isSaved)
                }
                .padding()
                
                
                
                // border
                Divider()
                
                // recipe price and cook time
                //HStack {
                  //  Text(recipe.cooktime)
                        
                    //Spacer()
                        
                    //Text(recipe.price)
                    
                //}
                    

                RecipeIngredients(recipe: recipe)

                
            }
            .padding()
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

struct RecipeDetails_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        Group {
            RecipeDetails(recipe: modelData.recipes[0])
                .environmentObject(modelData)
            RecipeDetails(recipe: modelData.recipes[0])
                .environmentObject(modelData)
        }
    }
}
