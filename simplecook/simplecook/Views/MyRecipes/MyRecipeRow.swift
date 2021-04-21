//
//  MyRecipeRow.swift
//  simplecook
//
//  Created by Conor Thorne on 31/03/2021.
//

import SwiftUI

struct MyRecipeRow: View {
    
    @State private var recipesData = MyRecipeModel.data     // recipe data
    @Binding var recipesBinding : [MyRecipeModel]           // list of recipes
    @Binding var shoppinglist : [MyShoppingData]            // shopping list data

    var category : String           // category of list
    var recipes : [MyRecipeModel]   // recipes
    
    var body: some View {
        VStack(alignment: .leading){
            // display category name
            Text(category)
                .font(.system(size:25))
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
                
            Divider()
                
            // display each recipe in category
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 30){
                    ForEach(recipes) { recipe in
                        NavigationLink(destination: RecipeDetails(recipe: binding(for: recipe), recipes: $recipesBinding, shoppinglist:$shoppinglist)){
                            MyRecipeCard(recipe: recipe)
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    // function to retrieve a binding for a recipe
    private func binding(for recipe: MyRecipeModel) -> Binding<MyRecipeModel> {
        
        guard let recipeIndex = recipesBinding.firstIndex(where: { $0.title == recipe.title }) else {
            fatalError("Can't find recipe")
        }
        return $recipesBinding[recipeIndex]    // return binding
    }
}

struct MyRecipeRow_Previews: PreviewProvider {
    
    static var previews: some View {
        MyRecipeRow(recipesBinding: .constant(MyRecipeModel.data), shoppinglist:.constant(ModelData().shoppinglist), category:"Breakfast", recipes: MyRecipeModel.data)
    }
}
