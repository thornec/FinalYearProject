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
        TabView(selection: $selection){
            CategoryHome()
                .tabItem {
                                    Label("Featured", systemImage: "star")
                                }
            RecipeList()
                .tabItem {
                                    Label("List", systemImage: "list.bullet")
                                }        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData()) // adds model object to enviornment making it available to any subview
    }
}
