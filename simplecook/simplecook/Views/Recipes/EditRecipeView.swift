//
//  EditRecipeView.swift
//  simplecook
//
//  Created by Conor Thorne on 22/03/2021.
//

import SwiftUI

// view used for editing values of recipe
struct EditRecipeView: View {
    // recipe data, passed from detail view
    @Binding var recipeData : MyRecipeModel.Data
    
    // state variables that are used to update recipe values
    @State private var newIngredient = ""           // hold new ingredient entered
    @State private var newServing = ""              // hold new serving entered
    @State private var newStep = ""                 // hold new step entered
    @State private var isSaved = false              // hold true if recipe is saved
    
    var body: some View {
        List {
            // recipe title
            Section(header: Text("Recipe Title")) {
            HStack{
                    // include title string binding
                    TextField("Title", text: $recipeData.title)
                }
            }
            // recipe saved
            Toggle(isOn: $recipeData.isSaved){
                Text("Save Recipe")
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
            Section(header: Text("Recipe Ingredients                                              Quantity")) {
                // include each ingredient binding
                ForEach(Array(zip(recipeData.ingredients, recipeData.servings)), id: \.0){ ingredient in
                    HStack{
                        // ingredient name
                        Text(ingredient.0)
                        Spacer()
                        // ingredient quantity
                        Text("\(ingredient.1)")
                    }
                }
                // if user swipes to delete an ingredient from recipe
                .onDelete { indices in
                    // remove recipe from ingredient data
                    recipeData.ingredients.remove(atOffsets: indices)   // delete ingredient
                    recipeData.servings.remove(atOffsets: indices)      // delete serving
                }
            // field for adding new ingredient
            HStack {
                    TextField("New Ingredient", text: $newIngredient)   // add new ingredient
                    TextField("Quantity", text: $newServing)            // enter new ingredient quantity
                
                    // button to add ingredient
                    Button(action: {
                        // animation block
                        withAnimation {
                            recipeData.ingredients.append(newIngredient)   // add new ingredient to list
                            var val = Int(newServing)                      // convert entered value to int
                            recipeData.servings.append(val!)               // add new servings to list

                            newIngredient = ""  // reset state variable for more ingredients to be entered
                            newServing = ""     // reset state variable for more servings to be entered
                        }
                    }) {
                        // plus icon
                        Image(systemName: "plus.circle")
                            .accessibilityLabel(Text("Add ingredient"))    // accesibility modifier
                    }
                    .disabled(newIngredient.isEmpty)                       // user cannot enter new ingredient if it is empty
                }
            }
            // recipe method
            Section(header: Text("Recipe Method")) {
                // display each step in method
                ForEach(recipeData.method, id: \.self){ step in
                    Text(step)
                }
                // if user swipes to delete instruction
                .onDelete { indices in
                    recipeData.method.remove(atOffsets: indices)            // delete step from data
                }
                // field for adding new step
                HStack {
                    TextField("New Step", text: $newStep)                   // add new method step
                    // button to add step
                    Button(action: {
                        // animation block
                        withAnimation {
                            recipeData.method.append(newStep)   // add new step to list
                            newStep = ""                        // reset state variable for more steps to be entered
                        }
                    }) {
                        // plus icon
                        Image(systemName: "plus.circle")
                            .accessibilityLabel(Text("Add step"))           // accessibility modifier
                    }
                    .disabled(newStep.isEmpty)                             // user cannot enter step if field is empty
                }
            }
        }
        .listStyle(InsetGroupedListStyle())         // change style of list to follow form conventions
    }
}

struct EditRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeView(recipeData: .constant(MyRecipeModel.data[0].data))
    }
}

