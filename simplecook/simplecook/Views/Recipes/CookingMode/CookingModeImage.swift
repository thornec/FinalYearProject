//
//  CookingModeImage.swift
//  simplecook
//
//  Created by Conor Thorne on 02/03/2021.
//

import SwiftUI

// cooking mode image view
struct CookingModeImage: View {
    var image : String  // image name
    
    var body: some View {
        // image
        Image(image)
            .interpolation(.none)               // stops pixels
            .resizable()
            .frame(width:450, height: 550)     // frame
            .edgesIgnoringSafeArea(.all)       // ignore top
    }
}

struct CookingModeImage_Previews: PreviewProvider {
    static var previews: some View {
        CookingModeImage(image:"step1")
    }
}
