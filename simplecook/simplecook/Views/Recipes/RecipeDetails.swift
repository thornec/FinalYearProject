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
    
    // compute index of input recipe by comparing it to model data
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
  
                // ingredients and method display
                iPages{
                    RecipeIngredients(recipe: recipe)
                    
                    // method calls
                    RecipeMethod(step: recipe.method[0], image_string : "step1")

                }
                .dotsBackgroundStyle(.prominent)
                .frame(width: 380, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(radius: 7)


                // cooking mode button
                CookingButton()
                    .offset(x:15)
                
                
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
        }
    }
}
