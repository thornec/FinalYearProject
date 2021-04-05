//
//  RecipeDetails.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import SwiftUI
import iPages

struct RecipeDetails: View {
    // state variables
    @State private var isCookingMode = false
    @State private var isEditMode = false
    // state variables for dictionary search
    @State var isDictionary = false
    @State var word = ""
    
    // recipe data
    @Binding var recipe: MyRecipeModel
    
    // compute index of input recipe by comparing it to model data
    var recipeIndex: Int {
    MyRecipeModel.data.firstIndex(where: {
            $0.title == recipe.title
        })!
    }
        
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView  {
                    // import recipe image component
                    Image(recipe.imageName)
                        .resizable()
                        .frame(width:500, height:500)
                        .edgesIgnoringSafeArea(.top)
                        .shadow(radius: 9)

                    // recipe ingredients list
                    RecipeIngredients(recipe: $recipe, recipes : MyRecipeModel.data[recipeIndex])
                        .frame(width:geometry.size.width)
                        .padding(20)
                    
                    
                    VStack(alignment: .leading){
                        // built in recipe
                        if(!recipe.isCustom){
                            Button {
                                isCookingMode = true
                            } label: {
                                CookingButton(string:"start cooking!")
                            }
                        } else {
                            // custom recipe
                            //CustomMethod(recipe:recipe)
                        }
                    }
                    .padding(20)
                }
                
                // recipe nutrition
                NutritionView(query: "garlic")
            }
            .navigationTitle(recipe.title)
            .navigationBarItems(trailing: SaveButton(isSet: $recipe.isSaved).font(.title))
            .fullScreenCover(isPresented:$isCookingMode){
                // present cooking mode
                NavigationView{
                    CookingMode(recipe:recipe)
                        .navigationBarItems(leading:
                            Button(action: {
                                isCookingMode = false
                            }){
                                Text("Back")
                            }
                    )
                }
            }
        }
        //.navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeDetails_Previews: PreviewProvider {
        
    static var previews: some View {
        Group {
            RecipeDetails(recipe: .constant(MyRecipeModel.data[1]))
        }
    }
}

