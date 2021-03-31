//
//  CategoryItem.swift
//  simplecook
//
//  Created by Conor Thorne on 18/02/2021.
//

import SwiftUI

struct CategoryItem: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading){
            recipe.image
                .resizable()
                .frame(width:255, height: 255)
                .cornerRadius(5)
            HStack{
                Text(recipe.name)
                    .foregroundColor(.primary)
                    .font(.system(size:16))
                    .font(.caption)
                    
                // check if recipe is saved
                if recipe.isSaved {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width:16,height:16)
                        .foregroundColor(.yellow)
                }
            }
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(recipe: ModelData().recipes[0])
    }
}
