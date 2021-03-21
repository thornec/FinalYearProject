//
//  ContentView.swift
//  simplecook
//
//  Created by Conor Thorne on 16/02/2021.
//

import SwiftUI

// content and layout
struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // tab bar
        TabView(selection: $selection){
            // search page
            CategoryHome()
                .tabItem
                {
                    Label("Search", systemImage: "magnifyingglass.circle")
                }
            
            // shopping list page
            TabPage()
                .tabItem
                {
                    Label("Shopping List", systemImage: "list.bullet")
                }
            
            // shopping list page
            MyRecipes()
                .tabItem
                {
                    Label("My Recipes", systemImage: "person.circle")
                }
            // shopping list page
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData()) // adds model object to enviornment making it available to any subview
    }
}
