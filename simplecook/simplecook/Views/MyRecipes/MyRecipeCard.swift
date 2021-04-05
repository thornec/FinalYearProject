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
        VStack(alignment: .leading) {
            // recipe image
            Image(recipe.imageName)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .frame(width:255, height: 255)

            HStack {
                // recipe title
                Text(recipe.title)
                    .foregroundColor(.primary)
                    .font(.system(size:16))
                    .font(.caption)
                                
                // check if recipe is saved
                if !recipe.isSaved {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width:16,height:16)
                        .foregroundColor(.yellow)
                        .padding(.trailing)
                }
                                
                // cook time
                Label("\(recipe.cooktime)", systemImage: "clock")
                    .padding()
                    .font(.subheadline)
                    .accessibilityElement(children: .ignore)                    // ignore label
                    .accessibilityLabel(Text("Recipe Cook Time"))               // say recipe cook time
                    .accessibilityValue(Text("\(recipe.cooktime) minutes"))     // say cook time
                
                /* cost
                Label("\(recipe.cost)", systemImage: "dollarsign.square")
                    .accessibilityElement(children: .ignore)                    // ignore label
                    .accessibilityLabel(Text("Recipe Cost"))                    // say recipe cost
                    .accessibilityValue(Text("\(recipe.cost) euro"))            // say cost of recipe
                */
            }            
        }
    }
}


struct MyRecipeCard_Previews: PreviewProvider {
    static var recipe = MyRecipeModel.data[1]                 // test data
    
    static var previews: some View {
        MyRecipeCard(recipe:recipe)
    }
}
