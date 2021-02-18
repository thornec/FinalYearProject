//
//  CategoryRow.swift
//  simplecook
//
//  Created by Conor Thorne on 18/02/2021.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Recipe]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)    // display category name
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { recipe in
                        NavigationLink(destination: RecipeDetails(recipe: recipe)){
                            CategoryItem(recipe: recipe)
                        }
                    }
                }
            }
            .frame(height:185)
        }
        
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    
    static var previews: some View {
        CategoryRow(
            categoryName: recipes[0].category.rawValue,
            items: Array(recipes.prefix(4))
        )
    }
}
