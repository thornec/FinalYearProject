//
//  CategoryHome.swift
//  simplecook
//
//  Created by Conor Thorne on 18/02/2021.
//

import SwiftUI
import SlidingTabView

struct CategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var selectedTabIndex = 0

    
    @Binding var recipes: [MyRecipeModel]
    var categories = ["Breakfast", "Lunch", "Dinner"]
    
    @Environment(\.scenePhase) private var scenePhase   // save user data when inactive
    @State private var isAddMode = false                // control presentation of view
    @State private var newRecipe = MyRecipeModel.Data()
    
    @Binding var shoppinglist : [MyShoppingData]

    let saveAction: () -> Void

    // state variables for search
    @State private var searchText : String = ""        // current search term value
    @State private var showSavedOnly = false           // save mode variable
    
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
                    // search bar
                    SearchBar(text: $searchText, placeholder: "search by recipe or ingredients")
                            
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["All", "Saved", "Personal"])
                    // all
                    if(selectedTabIndex == 0){
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist, category: "Breakfast", recipes: filteredBreakfast)
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist, category: "Lunch", recipes: filteredLunch)
                        MyRecipeRow(recipesBinding: $recipes, shoppinglist:$shoppinglist, category: "Dinner", recipes: filteredDinner)
                    }
                    // saved
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
                .background(Color.white)
                .foregroundColor(.black)                    // sets color of text
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)
            }
            // nav bar title
            .navigationTitle("Recipes")
            // add recipe
            .navigationBarItems(trailing: Button(action: {
                isAddMode = true // user has entered add recipe mode
            }) {
                Image(systemName: "plus")   // add a new recipe
                    .font(.title)
            })
            .sheet(isPresented: $isAddMode){
                NavigationView {
                    EditRecipeView(recipeData: $newRecipe)    // pass new recipe data to be filled
                        .navigationBarItems(leading: Button("Dismiss") {
                            isAddMode = false   // exit add mode
                        }, trailing: Button("Add") {
                            let new = MyRecipeModel(title: newRecipe.title, ingredients: newRecipe.ingredients, method: newRecipe.method, cost: newRecipe.cost, cooktime: newRecipe.cooktime, imageName:"myrecipe", isCustom: true, categoryName : "Lunch", servings: [1,2,3], method_images: [""], isSaved: false)  // create new recipe with values from user
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
        CategoryHome(recipes: .constant(MyRecipeModel.data), shoppinglist:.constant(MyShoppingData.data), saveAction: {})
            .environmentObject(ModelData())
    }
}
