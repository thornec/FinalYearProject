//
//  SlidingTabView.swift
//  simplecook
//
//  Created by Conor Thorne on 18/03/2021.
//

import SwiftUI
import SlidingTabView

struct SlidingTabViewConsumer: View {
    
    @State private var selectedTabIndex = 1
    let minDragTranslationForSwipe: CGFloat = 50        // once swipe is = 50 it will change page
    let numTabs = 3
    
    
    var body: some View {
        VStack(alignment: .leading) {
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["All", "Saved", "Personal"])
                    if(selectedTabIndex == 0){
                        Text("First View")
                    }
                    if(selectedTabIndex == 1){
                        Text("Second View")
                    }
                    if(selectedTabIndex == 2){
                        Text("3")
                    }
            
                    Spacer()
                }
                .padding(.top, 50)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(width:380, height:800)
                .background(Color.white)
                .foregroundColor(.black)                    // sets color of text
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)
                .padding()

            }
    
    // handle user swipe
    private func handleSwipe(translation: CGFloat) {
        if translation > minDragTranslationForSwipe && selectedTabIndex > 0 {
            selectedTabIndex -= 1
        } else  if translation < -minDragTranslationForSwipe && selectedTabIndex < numTabs-1 {
            selectedTabIndex += 1
        }
    }

}

struct SlidingTabView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingTabViewConsumer()
    }
}
