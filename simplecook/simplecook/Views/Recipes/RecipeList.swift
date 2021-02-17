//
//  RecipeList.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import SwiftUI

struct RecipeList: View {
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    @State private var showFavoritesOnly = false
    
    // state for saved recipes
    @State private var showSavedOnly = false
    
    // filtered version displaying saved recipes only
    var filteredRecipes: [Recipe] {
        modelData.recipes.filter { recipe in
            (!showSavedOnly || recipe.isSaved)
        }
    }
    
    var body: some View {
        NavigationView{
            // list recipes row and destination
            List{
                Toggle(isOn: $showSavedOnly){
                    Text("Saved Recipes")
                }
                
                ForEach(filteredRecipes){ recipe in
                    NavigationLink(destination: RecipeDetails(recipe: recipe)){
                        RecipeRow(recipe: recipe)
                    }
                }
            }
        }
        .navigationTitle("Recipes")
    }
}

struct RecipeList_Previews: PreviewProvider {
    
    
    static var previews: some View {
        RecipeList().environmentObject(ModelData())
    
    }
}
