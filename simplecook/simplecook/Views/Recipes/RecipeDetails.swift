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
    @State private var isCookingMode = false
    @State var isSwipping = true
    @State var startPosition : CGPoint = .zero  // begining position of user drag
    
    var recipe: Recipe
    
    // compute index of input recipe by comparing it to model data
    var recipeIndex: Int {
        modelData.recipes.firstIndex(where: {
            $0.id == recipe.id
        })!
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView  {
                    // import recipe image component
                    Image(recipe.imageName)
                        .edgesIgnoringSafeArea(.top)
                        .shadow(radius: 9)

                    // recipe ingredients list
                    RecipeIngredients(recipe: recipe)
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
                            CustomMethod(recipe:recipe)
                        }
                    }
                    .padding(20)
                }
            }
            .navigationTitle(recipe.name)
            .navigationBarItems(trailing: SaveButton(isSet: $modelData.recipes[recipeIndex].isSaved).font(.title))
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

