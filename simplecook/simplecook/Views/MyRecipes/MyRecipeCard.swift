//
//  RecipeCard.swift
//  simplecook
//
//  Created by Conor Thorne on 22/03/2021.
//

import SwiftUI

struct MyRecipeCard: View {
    let recipe : MyRecipeModel
    var body: some View {
        // recipe title
        VStack(alignment: .leading) {
            Text(recipe.title)
                .font(.headline)
            
            Spacer()
            
            // labels
            HStack {
                // cost
                Label("\(recipe.cost)", systemImage: "dollarsign.square")
                    .accessibilityElement(children: .ignore)                    // ignore label
                    .accessibilityLabel(Text("Recipe Cost"))                    // say recipe cost
                    .accessibilityValue(Text("\(recipe.cost) euro"))            // say cost of recipe
                
                Spacer()
                
                // cook time
                Label("\(recipe.cooktime)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .accessibilityElement(children: .ignore)                    // ignore label
                    .accessibilityLabel(Text("Recipe Cook Time"))               // say recipe cook time
                    .accessibilityValue(Text("\(recipe.cooktime) minutes"))     // say cook time
            }
        }
        .padding()
    }
}

struct MyRecipeCard_Previews: PreviewProvider {
    static var recipe = MyRecipeModel.data[1]                 // test data
    static var previews: some View {
        MyRecipeCard(recipe:recipe)
            .previewLayout(.fixed(width: 400, height: 100))  // fixed preview view
    }
}
