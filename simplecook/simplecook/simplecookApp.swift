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
    @StateObject private var modelData = ModelData()    // json for shopping list
    @ObservedObject private var data = MyRecipeData()   // locally stored recipe data
    @State private var selection: Tab = .featured       // state of tab bar
    @State var shoppinglist = ModelData().shoppinglist
    
    // tab bar struct
    enum Tab {
        case featured
        case list
    }
    
    // returns scenes
    var body: some Scene {
        WindowGroup {
            // tab bar
            TabView(selection: $selection){
            // search page
                CategoryHome(recipes: $data.myrecipes, shoppinglist: $shoppinglist){ data.save()}.environmentObject(ModelData())
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
               data.load() // load data
            }

        }
    }
}
