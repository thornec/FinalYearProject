//
//  EditRecipeView.swift
//  simplecook
//
//  Created by Conor Thorne on 22/03/2021.
//

import SwiftUI

struct EditRecipeView: View {
    @Binding var recipeData : MyRecipeModel.Data    // passed from detail view
    @State private var newIngredient = ""   // hold new ingredient entered
    @State private var newStep = ""   // hold new step entered

    var body: some View {
        List {
            // recipe title
            Section(header: Text("Recipe Title")) {
                // include title string binding
                TextField("Title", text: $recipeData.title)
            }
            // recipe cook time
            Section(header: Text("Recipe Cook Time")) {
                // include cook time int binding
                TextField("Cook Time", value: $recipeData.cooktime, formatter: NumberFormatter())
            }
            // recipe cost
            Section(header: Text("Recipe Cost")) {
                // include recipe cost int binding
                TextField("Recipe Cost", value: $recipeData.cost, formatter: NumberFormatter())
            }
            // recipe ingredients
            Section(header: Text("Recipe Ingredients")) {
                // include each ingredient binding
                ForEach(recipeData.ingredients, id: \.self){ ingredient in
                    Text(ingredient)
                }
                .onDelete { indices in
                    recipeData.ingredients.remove(atOffsets: indices)   // delete ingredient
                }
                HStack {
                    TextField("New Ingredient", text: $newIngredient)   // add new ingredient
                    // button to add ingredient
                    Button(action: {
                        // animation block
                        withAnimation {
                            recipeData.ingredients.append(newIngredient)   // add new ingredient to list
                            newIngredient = ""  // reset state variable for more ingredients to be entered
                        }
                    }) {
                        Image(systemName: "plus.circle")
                            .accessibilityLabel(Text("Add ingredient")) // accesibility modifier
                    }
                    .disabled(newIngredient.isEmpty)    // user cannot enter ingredient if it is empty
                }
            }
            // recipe method
            Section(header: Text("Recipe Method")) {
                // include each method
                ForEach(recipeData.method, id: \.self){ step in
                    Text(step)
                }
                .onDelete { indices in
                    recipeData.method.remove(atOffsets: indices)   // delete step
                }
                HStack {
                    TextField("New Step", text: $newStep)   // add new ingredient
                    // button to add step
                    Button(action: {
                        // animation block
                        withAnimation {
                            recipeData.method.append(newStep)   // add new step to list
                            newStep = ""  // reset state variable for more steps to be entered
                        }
                    }) {
                        Image(systemName: "plus.circle")
                            .accessibilityLabel(Text("Add step"))   // accessibility modifier
                    }
                    .disabled(newStep.isEmpty)    // user cannot enter step if it is empty
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeView(recipeData: .constant(MyRecipeModel.data[0].data))
    }
}

