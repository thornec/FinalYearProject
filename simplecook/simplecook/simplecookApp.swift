//
//  simplecookApp.swift
//  simplecook
//
//  Created by Conor Thorne on 16/02/2021.
//

import SwiftUI

// app entry point
@main
struct simplecookApp: App {
    @StateObject private var modelData = ModelData()
    
    @ObservedObject private var data = MyRecipeData()
    
    @State private var selection: Tab = .featured

    
    enum Tab {
        case featured
        case list
    }
    
    
    // returns scenes
    var body: some Scene {
        WindowGroup {
            //NavigationView{
                // tab bar
                TabView(selection: $selection){
                    // search page
                    CategoryHome().environmentObject(ModelData())
                        .tabItem
                        {
                            Label("Search", systemImage: "magnifyingglass.circle")
                        }
                    // shopping list
                    TabPage().environmentObject(ModelData())
                        .tabItem
                        {
                            Label("Shopping List", systemImage: "list.bullet")
                        }
                    // my recipes
                   // NavigationView{
                    MyRecipeView(recipes: $data.myrecipes){ data.save()}
                        .tabItem
                        {
                            Label("My Recipes", systemImage: "person.circle")
                        }
                    }
                    .onAppear {
                        data.load() // load data
                    }
                //}
            //}
        }
    }
}
