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
    
    // tab bar struct
    enum Tab {
        case featured
        case list
    }
    
    // State Variables
    @ObservedObject private var data = MyRecipeData()   // locally stored recipe data
    @StateObject private var modelData = ModelData()    // model data for dictionary
    @State var shoppinglist = ModelData().shoppinglist  // data for shopping list
    @State private var selection: Tab = .featured       // state of tab bar
    
    // returns scenes
    var body: some Scene {
        WindowGroup {
            // tab bar
            TabView(selection: $selection){
                // search page
                CategoryHome(shoppinglist: $shoppinglist, recipes: $data.myrecipes){ data.save()}.environmentObject(ModelData())
                .tabItem
                {
                    Label("Search", systemImage: "magnifyingglass.circle")
                }
                // shopping list
                ShopList(shoppinglist: $shoppinglist).environmentObject(ModelData())
                .tabItem
                {
                    Label("Shopping List", systemImage: "list.bullet")
                }
            }
            .onAppear {
               data.load() // load data from phone storage
            }

        }
    }
}
