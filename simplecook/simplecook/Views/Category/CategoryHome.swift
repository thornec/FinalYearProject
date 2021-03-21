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

    
    @State private var searchText : String = ""

    
    // state variables
    @State private var showSavedOnly = false

    
    // filtered version displaying saved recipes only
    var filteredLunch: [Recipe] {
        filteredSearch.filter { recipe in
            (!showSavedOnly && recipe.category.rawValue == "Lunch" || recipe.isSaved && recipe.category.rawValue == "Lunch" )
        }
    }
    
    // filtered version displaying saved recipes only
    var filteredDinner: [Recipe] {
        filteredSearch.filter { recipe in
            (!showSavedOnly && recipe.category.rawValue == "Dinner" || recipe.isSaved && recipe.category.rawValue == "Dinner" )
        }
    }
    
    // filtered version displaying saved recipes only
    var savedBreakfast: [Recipe] {
        filteredBreakfast.filter { recipe in
            (recipe.isSaved)
        }
    }
    
    // filtered version displaying saved recipes only
    var savedLunch: [Recipe] {
        filteredLunch.filter { recipe in
            (recipe.isSaved)
        }
    }
    
    // filtered version displaying saved recipes only
    var savedDinner: [Recipe] {
        filteredDinner.filter { recipe in
            (recipe.isSaved)
        }
    }
    
    // filtered version displaying saved recipes only
    var personalBreakfast: [Recipe] {
        filteredBreakfast.filter { recipe in
            (recipe.isCustom)
        }
    }
    
    // filtered version displaying saved recipes only
    var personalLunch: [Recipe] {
        filteredLunch.filter { recipe in
            (recipe.isCustom)
        }
    }
    
    // filtered version displaying saved recipes only
    var personalDinner: [Recipe] {
        filteredDinner.filter { recipe in
            (recipe.isCustom)
        }
    }
    
    // compute filtered version of list
    var filteredSearch : [Recipe] {
        modelData.recipes.filter { recipe in
            (recipe.name.lowercased().contains(self.searchText.lowercased()) || self.searchText.isEmpty) && (!showSavedOnly || recipe.isSaved) || recipe.ingredients[0].lowercased().contains(self.searchText.lowercased()) || recipe.ingredients[1].lowercased().contains(self.searchText.lowercased()) || recipe.ingredients[2].lowercased().contains(self.searchText.lowercased()) || recipe.ingredients[3].lowercased().contains(self.searchText.lowercased())
        }
    }
    
    // filtered version displaying saved recipes only
    var filteredBreakfast: [Recipe] {
        filteredSearch.filter { recipe in
            (!showSavedOnly && recipe.category.rawValue == "Breakfast" || recipe.isSaved && recipe.category.rawValue == "Breakfast" )
        }
    }
    
    
    
    var body: some View {
            NavigationView {
                VStack() {
                    Text("").padding(40)
                    
                    VStack{
                    ScrollView{
                        
                        // search bar
                        SearchBar(text: $searchText, placeholder: "search by recipe or ingredients")
                            .padding()
                        
                            SlidingTabView(selection: self.$selectedTabIndex, tabs: ["All", "Saved", "Personal"])
                            // all
                            if(selectedTabIndex == 0){
                                CategoryRow(categoryName: "Breakfast", items: filteredBreakfast)
                                CategoryRow(categoryName: "Lunch", items: filteredLunch)
                                CategoryRow(categoryName: "Dinner", items: filteredDinner)
                            }
                            // saved
                            if(selectedTabIndex == 1){
                                CategoryRow(categoryName: "Breakfast", items: savedBreakfast)
                                CategoryRow(categoryName: "Lunch", items: savedLunch)
                                CategoryRow(categoryName: "Dinner", items: savedDinner)
                            }
                            // personal
                            if(selectedTabIndex == 2){
                                CategoryRow(categoryName: "Breakfast", items: personalBreakfast)
                                CategoryRow(categoryName: "Lunch", items: personalLunch)
                                CategoryRow(categoryName: "Dinner", items: personalDinner)
                            }
                    
                        }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width:390, height:900)
                        .background(Color.white)
                        .foregroundColor(.black)                    // sets color of text
                        .cornerRadius(20)                           // rounds corners
                        .shadow(radius:9)
                    .offset(y:50)
                }
                .navigationTitle("Recipes")

            }
        }

    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
