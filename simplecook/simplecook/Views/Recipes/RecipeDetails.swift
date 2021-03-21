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
        NavigationView{
            
            ScrollView{
            
                // import recipe image component
                RecipeImage(image: recipe.image)
                    .ignoresSafeArea(edges: .top)

                // recipe title
                HStack{
                    Text(recipe.name)
                        .font(.title)
                        .padding()
                        .foregroundColor(.primary)
                

                    SaveButton(isSet: $modelData.recipes[recipeIndex].isSaved)
                }
                
                VStack(alignment: .leading){
                    // recipe ingredients list
                    RecipeIngredients(recipe: recipe)
                        .padding()
                
                    if(!recipe.isCustom){
                        // recipe method
                        RecipeMethod(recipe:recipe)
                            .padding()
                    } else {
                        CustomMethod(recipe:recipe)
                    }
                    
                    if(!recipe.isCustom){
                        // cooking mode button
                        NavigationLink(destination: CookingMode(recipe:recipe)){
                            CookingButton(string:"start cooking!")
                        }
                        .padding()
                    }
                }
                
                
            }
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




//}
//.dotsBackgroundStyle(.prominent)
//.frame(width: 380, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//.shadow(radius: 7)

