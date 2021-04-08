//
//  AddRecipe.swift
//  simplecook
//
//  Created by Conor Thorne on 08/03/2021.
//

import SwiftUI

// form for user to add a recipe to the database
struct AddRecipe: View {
    
    @State private var recipename = ""
    @State private var recipeingredients = ["","","","","",""]
    @State private var recipemethod = ["","","","","",""]
    var myrecipes : [Recipe]
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically

    var body: some View {
        NavigationView {
            Form {
                
                // name and photo
                Section(header: Text("recipe name")){
                    TextField("enter the name of the recipe", text: $recipename)
                    
                   // UploadImage()
                }
                
                if(modelData.recipes.indices.contains(3)){
                    Text(modelData.recipes[3].name)
                }
                
                // ingredients
                Section(header: Text("recipe ingredients")){
                    TextField("ingredient one", text: $recipeingredients[0])
                    TextField("ingredient two", text: $recipeingredients[1])
                    TextField("ingredient three", text: $recipeingredients[2])
                    TextField("ingredient four", text: $recipeingredients[3])
                    TextField("ingredient five", text: $recipeingredients[4])
                }
                
                // method
                Section(header: Text("method")){
                    //TextEditor("step one",text: $recipemethod[0])
                    TextField("step one", text: $recipemethod[0])
                    TextField("step two", text: $recipemethod[1])
                    TextField("step three", text: $recipemethod[2])
                    TextField("step four", text: $recipemethod[3])
                    TextField("step five", text: $recipemethod[4])

                }
                
                // save button
                Section {
                    Button(action : {
                        // create new recipe object & save recipe to json
                        let new : Recipe
                        new = createrecipe(recipename:recipename, method:recipemethod, ingredients:recipeingredients, recipes:modelData.recipes)
                        
                        // push new recipe to list
                        modelData.recipes.append(new)
                        
                    }) {
                        Text("add recipe").font(.subheadline)
                    }
                    .offset(x:110)
                }
                
            }
            .navigationTitle("add recipe")
        }
    }
}

struct AddRecipe_Previews: PreviewProvider {
    
    static var recipes = ModelData().myrecipes

    static var previews: some View {
        AddRecipe(myrecipes : recipes).environmentObject(ModelData())
    }
}


func createrecipe(recipename : String, method : [String], ingredients : [String], recipes : [Recipe]) -> Recipe {
    
    var recipe : Recipe
    recipe = recipes[1]

    recipe.name = recipename
    //recipe.category = Recipe.Category(rawValue : "Breakfast")!
    recipe.cooktime = "10mins"
    recipe.price = "0.0"
    recipe.id = findId(recipes:recipes)
    recipe.isCustom = true
    recipe.isSaved = true
    recipe.method = method
    recipe.ingredients = ingredients
    recipe.servings = [1,2]
    recipe.method_images = [""]
    recipe.imageName = "myrecipe"
    
    
    return recipe
    
}

func findId(recipes : [Recipe]) -> Int {
    let size = recipes.count - 1
    
    let idnumber = recipes[size].id + 1
    
    return idnumber
    
}



