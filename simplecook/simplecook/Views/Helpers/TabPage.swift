//
//  Tab.swift
//  simplecook
//
//  Created by Conor Thorne on 17/03/2021.
//

import SwiftUI





struct TabPage: View {
    
    
    @State private var selectedTab = 1      // which tab is selected
    let minDragTranslationForSwipe: CGFloat = 50        // once swipe is = 50 it will change page
    let numTabs = 2

    var body: some View {
        TabView(selection: $selectedTab){
                    NavigationView{
                        Text("Hello, World!")
                    }.tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                     .highPriorityGesture(DragGesture().onEnded({
                         self.handleSwipe(translation: $0.translation.width)
                     }))
            
            
                    NavigationView{
                        Text("Salut, tout le monde!")
                    }.tabItem {
                        Image(systemName: "timelapse")
                        Text("Space")
                    }.tag(1)
                     .highPriorityGesture(DragGesture().onEnded({
                         self.handleSwipe(translation: $0.translation.width)
                     }))
                }

        
        
    }
    
    // handle user swipe
    private func handleSwipe(translation: CGFloat) {
        if translation > minDragTranslationForSwipe && selectedTab > 0 {
            selectedTab -= 1
        } else  if translation < -minDragTranslationForSwipe && selectedTab < numTabs-1 {
            selectedTab += 1
        }
    }
}

struct TabPage_Previews: PreviewProvider {
    static var previews: some View {
        TabPage()
    }
}

