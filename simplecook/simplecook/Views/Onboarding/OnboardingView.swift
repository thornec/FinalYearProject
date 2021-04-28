//
//  OnboardingView.swift
//  simplecook
//
//  Created by Conor Thorne on 28/04/2021.
//

import SwiftUI

// onboarding view
struct OnboardingView: View {
    
    // initalize sub views
    var subviews = [
            // transform subviews into uiviewcontroller
            UIHostingController(rootView: Subview(image: "meditating")),
            UIHostingController(rootView: Subview(image: "skydiving")),
            UIHostingController(rootView: Subview(image: "sitting"))
        ]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
