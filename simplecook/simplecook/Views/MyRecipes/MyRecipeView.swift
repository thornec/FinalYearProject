//
//  MyRecipeView.swift
//  simplecook
//
//  Created by Conor Thorne on 22/03/2021.
//

import SwiftUI

struct MyRecipeView: View {
    @Binding var recipes: [MyRecipeModel]
    @Environment(\.scenePhase) private var scenePhase   // save user data when inactive
    @State private var isAddMode = false                // control presentation of view
    @State private var newRecipe = MyRecipeModel.Data()
    
    let saveAction: () -> Void
    
    var body: some View {
        NavigationView {
            List {
                // display each my recipe row
                ForEach(recipes){ recipe in
                    NavigationLink(destination: MyRecipeDetailView(recipe: binding(for: recipe))) {
                        MyRecipeCard(recipe : recipe)
                    }
                }
            }
            .navigationTitle("My Recipes")
            .navigationBarItems(trailing: Button(action: {
                isAddMode = true // user has entered add recipe mode
            }) {
                        Image(systemName: "plus")   // add a new recipe
            })
            .sheet(isPresented: $isAddMode){
                NavigationView {
                    EditRecipeView(recipeData: $newRecipe)    // pass new recipe data to be filled
                        .navigationBarItems(leading: Button("Dismiss") {
                            isAddMode = false   // exit add mode
                        }, trailing: Button("Add") {
                            let new = MyRecipeModel(title: newRecipe.title, ingredients: newRecipe.ingredients, method: newRecipe.method, cost: newRecipe.cost, cooktime: newRecipe.cooktime, isCustom: true, isSaved: false)  // create new recipe with values from user
                            recipes.append(new) // push recipe onto list
                            isAddMode = false   // exit add mode
                        })
                }
                // triggered when value changes
                .onChange(of: scenePhase) { phase in
                    // if unactive call save
                    if phase == .inactive { saveAction() }
                }
        }
        }
    }
    
    // function to retrieve a binding for a recipe
    private func binding(for recipe: MyRecipeModel) -> Binding<MyRecipeModel> {
        guard let recipeIndex = recipes.firstIndex(where: { $0.id == recipe.id }) else {
            fatalError("Can't find recipe")
        }
        return $recipes[recipeIndex]    // return binding
    }
}

struct MyRecipeView_Previews: PreviewProvider {
    static var previews: some View {
            MyRecipeView(recipes: .constant(MyRecipeModel.data), saveAction: {})
    }
}

