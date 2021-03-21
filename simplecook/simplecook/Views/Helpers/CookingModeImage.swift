//
//  CookingModeImage.swift
//  simplecook
//
//  Created by Conor Thorne on 02/03/2021.
//

import SwiftUI

struct CookingModeImage: View {
    
    var image : String

    var body: some View {
        Image(image)
            .resizable()
            .frame(width:450, height: 350)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CookingModeImage_Previews: PreviewProvider {
    static var previews: some View {
        CookingModeImage(image:"step1")
    }
}
