//
//  RecipeRow.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        
        ZStack{
            
            //RoundedRectangle(cornerRadius:30)
            
            
            HStack {
                
                // image
                SearchBarImage(recipe:recipe)
                
                Text(recipe.name)
                    .font(.title)
                
                Spacer()
                
                // check if recipe is saved
                if recipe.isSaved {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                
                
            }
            .frame(width:330, height:120)
            .padding(.horizontal)                      // creates wide rectangle
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .foregroundColor(.black)                    // sets color of text
            .cornerRadius(20)                           // rounds corners
            .shadow(radius:9)
            .padding()
        }
        
        
    }
    

}

struct RecipeRow_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    
    
    static var previews: some View {
        Group{
            RecipeRow(recipe: recipes[0])
        }
        //.previewLayout(.fixed(width:300, height:70))
        // previewLayout modifier adjusted to represent a row in a list
        
    }
}

