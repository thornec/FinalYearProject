//
//  RecipeDetails.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import SwiftUI
import iPages

// view for displaying recipe details; image, cook time, name, ingredients
struct RecipeDetails: View {
    // state variables used for handling user navigation to cooking mode, edit mode or nutritional page
    @State private var isCookingMode = false
    @State private var isEditMode = false
    @State private var isNutritionMode = false

    // state variables for dictionary search
    @State var isDictionary = false
    @State var word = ""
    
    // recipe and shopping list data
    @Binding var recipe: MyRecipeModel
    @State private var data: MyRecipeModel.Data = MyRecipeModel.Data()
    @Binding var recipes : [MyRecipeModel]
    @Binding var shoppinglist : [MyShoppingData]
    
    // compute index of input recipe by comparing it to model data
    var recipeIndex: Int {
    recipes.firstIndex(where: {
            $0.title == recipe.title
        })!
    }
 
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack{
                    ScrollView  {
                        // import recipe image component
                        Image(recipe.imageName)
                            .resizable()
                            .frame(width:500, height:500)
                            .edgesIgnoringSafeArea(.top)
                            .shadow(radius: 9)
                        // recipe ingredients list
                        RecipeIngredients(recipe: $recipe, shoppinglist:$shoppinglist, recipes : recipes[recipeIndex], serving_sizes: recipe.servings)
                            .frame(width:geometry.size.width)
                            .padding(20)
                        // cooking mode button
                        Button {
                            isCookingMode = true    // button clicked, activate cooking mode screen
                        } label: {
                            CookingButton(string:"start cooking!")
                        }
                    }
                }
            }
            .navigationTitle(recipe.title)  // nav bar title
            .navigationBarItems(
                leading: SaveButton(isSet: $recipe.isSaved).font(.title).padding(10),
                trailing: Button("Edit"){
                    // edit recipe button
                    data = recipe.data      // set recipe data to be edited
                    isEditMode = true       // enter edit mode
                }
            )
            .background(EmptyView().sheet(isPresented: $isEditMode) {
                // present edit mode using entire screen
                NavigationView {
                    EditRecipeView(recipeData: $data)
                        .navigationTitle(recipe.title)  // nav bar title
                        .navigationBarItems(leading: Button("Cancel") {
                            isEditMode = false          // return from editing
                        }, trailing: Button("Done") {
                            isEditMode = false          // return
                            recipe.update(from: data)   // update values from edit
                    })
                }
            }
            .background(EmptyView().sheet(isPresented:$isCookingMode){
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
            }))
        }
    }
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeDetails(recipe: .constant(MyRecipeModel.data[1]), recipes: .constant(MyRecipeModel.data), shoppinglist: .constant(MyShoppingData.data))
        }
    }
}

