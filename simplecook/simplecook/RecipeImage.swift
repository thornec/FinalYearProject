//
//  RecipeImage.swift
//  simplecook
//
//  Created by Conor Thorne on 16/02/2021.
//

import SwiftUI

struct RecipeImage: View {
    var body: some View {
        Image("poachedeggs")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4)) // shadow circle
            .shadow(radius: 7)
    }
}

struct RecipeImage_Previews: PreviewProvider {
    static var previews: some View {
        RecipeImage()
    }
}
