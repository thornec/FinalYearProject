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
                .frame(width:155, height: 155)
                .cornerRadius(5)
            Text(recipe.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(recipe: ModelData().recipes[0])
    }
}
