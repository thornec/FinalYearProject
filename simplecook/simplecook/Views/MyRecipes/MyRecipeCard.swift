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
        VStack {
            HStack {
                Image(recipe.imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .frame(width:100, height:100)
                
                Text(recipe.title)
                    .font(.title)
                    .padding()
                
                Spacer()
                
                // check if recipe is saved
                if recipe.isSaved {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
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
        .padding(10)
        .frame(width:380, height:150)
        .background(Color.white)
        .foregroundColor(.black)                    // sets color of text
        .cornerRadius(20)                           // rounds corners
        .shadow(radius:9)
    }
}


struct MyRecipeCard_Previews: PreviewProvider {
    static var recipe = MyRecipeModel.data[1]                 // test data
    static var previews: some View {
        MyRecipeCard(recipe:recipe)
    }
}
