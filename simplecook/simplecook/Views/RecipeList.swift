//
//  RecipeList.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import SwiftUI

struct RecipeList: View {
    @EnviornmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    // state for saved recipes
    @State private var showSavedOnly = false
    
    // filtered version displaying saved recipes only
    var filteredRecipes: [Recipe] {
        recipes.filter{ recipe in
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
        //ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
          //         RecipeList()
           //            .previewDevice(PreviewDevice(rawValue: deviceName))
             //  }
        RecipeList()
            .enviornmentObject(ModelData())
    
    }
}
