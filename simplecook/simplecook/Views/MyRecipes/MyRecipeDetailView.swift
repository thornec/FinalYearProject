//
//  MyRecipeDetailView.swift
//  simplecook
//
//  Created by Conor Thorne on 22/03/2021.
//

import SwiftUI

struct MyRecipeDetailView: View {
    
    @Binding var recipe: MyRecipeModel
    @State private var isEditMode = false
    @State private var data: MyRecipeModel.Data = MyRecipeModel.Data()
    
    
    var body: some View {
        List{
            // title
            Section(header: Text("Recipe Title")) {
                Label("Recipe Title", systemImage: "timer")
            }
            // ingredients
            Section(header: Text("Ingredients")) {
                ForEach(recipe.ingredients, id: \.self){ ingredient in
                    Label(ingredient, systemImage: "cart")
                        .accessibilityLabel(Text("Ingredient"))
                        .accessibilityValue(Text(ingredient))
                }
            }
            // method
            Section(header: Text("Method")) {
                ForEach(recipe.method, id: \.self){ method in
                    Label(method, systemImage: "smallcircle.fill.circle.fill")
                        .accessibilityLabel(Text("Method"))
                        .accessibilityValue(Text(method))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit"){
            isEditMode = true
            data = recipe.data  // pass recipe data
        })
        .navigationTitle(recipe.title)
        .fullScreenCover(isPresented: $isEditMode) {
            // present edit mode using entire screen
            NavigationView {
                EditRecipeView(recipeData: $data)
                    .navigationTitle(recipe.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isEditMode = false          // return from editing
                    }, trailing: Button("Done") {
                        isEditMode = false          // return
                        recipe.update(from: data)   // update values from edit
                })
            }
        }
    }
}

struct MyRecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyRecipeDetailView(recipe:.constant(MyRecipeModel.data[1]))
        }
    }
}
