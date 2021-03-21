//
//  SearchBarImage.swift
//  simplecook
//
//  Created by Conor Thorne on 03/03/2021.
//

import SwiftUI

struct SearchBarImage: View {
    
    var recipe : Recipe
    
    var body: some View {
        
        VStack(alignment: .leading){
            Image(recipe.imageName)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .frame(width:100, height:100)
        }
        
    }
}

struct SearchBarImage_Previews: PreviewProvider {
    
    static var recipes = ModelData().recipes

    static var previews: some View {
        SearchBarImage(recipe : recipes[0])
    }
}
