//
//  CategoryHome.swift
//  simplecook
//
//  Created by Conor Thorne on 18/02/2021.
//

import SwiftUI
import SlidingTabView

// view for home page, hold search bar and displays all recipes
struct CategoryHome: View {
    // all data objects used
    @EnvironmentObject var modelData: ModelData         // model data
    @Environment(\.scenePhase) private var scenePhase   // save user data when inactive
    @Binding var shoppinglist : [MyShoppingData]        // shopping list
    @Binding var recipes: [MyRecipeModel]               // recipe list
    let saveAction: () -> Void

    // state variables for adding a new recipe
    @State private var newRecipe = MyRecipeModel.Data()
    @State private var isAddMode = false                // control presentation of view
    // state variables for search
    @State private var searchText : String = ""        // current search term value
    @State private var showSavedOnly = false           // save mode variable
    // state for keeping track of selected tab
    @State private var selectedTabIndex = 0
    // three different food categories
    var categories = ["Breakfast", "Lunch", "Dinner"]
        
    /* search variables used for displaying recipes depending on different search and tab settings */
    // compute filtered version of recipe list
    var filteredSearch : [MyRecipeModel] {
        recipes.filter { recipe in
            (recipe.title.lowercased().contains(self.searchText.lowercased()) || self.searchText.isEmpty) && (!showSavedOnly || recipe.isSaved)
        }
    }
    // filtered version displaying saved breakfast recipes only
    var filteredBreakfast: [MyRecipeModel] {
        filteredSearch.filter { recipe in
            (!showSavedOnly && recipe.categoryName == "Breakfast" || recipe.isSaved && recipe.categoryName == "Breakfast" )
        }
    }
    // filtered version displaying custom breakfast recipes only
    var personalBreakfast: [MyRecipeModel] {
        filteredBreakfast.filter { recipe in
            (recipe.isCustom)
        }
    }
    // filtered version displaying saved lunch recipes only
    var filteredLunch: [MyRecipeModel] {
        filteredSearch.filter { recipe in
            (!showSavedOnly && recipe.categoryName == "Lunch" || recipe.isSaved && recipe.categoryName == "Lunch" )
        }
    }
    // filtered version displaying saved dinner recipes only
    var filteredDinner: [MyRecipeModel] {
        filteredSearch.filter { recipe in
            (!showSavedOnly && recipe.categoryName == "Dinner" || recipe.isSaved && recipe.categoryName == "Dinner" )
        }
    }
    // filtered version displaying saved recipes only
    var savedBreakfast: [MyRecipeModel] {
        filteredBreakfast.filter { recipe in
            (recipe.isSaved)
        }
    }
    // filtered version displaying saved recipes only
    var savedLunch: [MyRecipeModel] {
        filteredLunch.filter { recipe in
            (recipe.isSaved)
        }
    }
    // filtered version displaying saved recipes only
    var savedDinner: [MyRecipeModel] {
        filteredDinner.filter { recipe in
            (recipe.isSaved)
        }
    }
    // filtered version displaying custom lunch recipes only
    var personalLunch: [MyRecipeModel] {
        filteredLunch.filter { recipe in
            (recipe.isCustom)
        }
    }
    // filtered version displaying custom dinner recipes only
    var personalDinner: [MyRecipeModel] {
        filteredDinner.filter { recipe in
            (recipe.isCustom)
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack{
                    // search bar view
                    SearchBar(text: $searchText, placeholder: "search by recipe or ingredients")
                    // sliding tab view
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["All", "Saved", "Personal"])
                    // category rows for "all"
                    if(selectedTabIndex == 0){
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist, category: "Breakfast", recipes: filteredBreakfast)
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist, category: "Lunch", recipes: filteredLunch)
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist, category: "Dinner", recipes: filteredDinner)
                    }
                    // category rows for "saved"
                    if(selectedTabIndex == 1){
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist, category: "Breakfast", recipes: savedBreakfast)
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist,  category: "Lunch", recipes: savedLunch)
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist,  category: "Dinner", recipes: savedDinner)
                    }
                    // personal
                    if(selectedTabIndex == 2){
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist,  category: "Breakfast", recipes: personalBreakfast)
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist,  category: "Lunch", recipes: personalLunch)
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist,  category: "Dinner", recipes: personalDinner)
                    }
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .background(Color.white)                     // make color white
                .foregroundColor(.black)                    // sets color of text
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)                           // shadow
            }
            // nav bar title
            .navigationTitle("Recipes")
            // add recipe
            .navigationBarItems(trailing: Button(action: {
                isAddMode = true            // user has entered add recipe mode
            }) {
                Image(systemName: "plus")   // plus icon to add a new recipe
                    .font(.title)
            })
            // cover screen with add recipe view
            .sheet(isPresented: $isAddMode){
                NavigationView {
                    EditRecipeView(recipeData: $newRecipe)    // pass new recipe data to be filled
                        .navigationBarItems(leading: Button("Dismiss") {
                            isAddMode = false   // exit add mode
                        }, trailing: Button("Add") {
                            // create new recipe object using user entered values and add to recipe data
                            let new = MyRecipeModel(title: newRecipe.title, ingredients: newRecipe.ingredients, method: newRecipe.method, cost: newRecipe.cost, cooktime: newRecipe.cooktime, imageName:"myrecipe", isCustom: true, categoryName : newRecipe.categoryName, servings: newRecipe.servings, method_images: [""], isSaved: newRecipe.isSaved)
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
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome(shoppinglist:.constant(MyShoppingData.data), recipes: .constant(MyRecipeModel.data), saveAction: {})
            .environmentObject(ModelData())
    }
}
