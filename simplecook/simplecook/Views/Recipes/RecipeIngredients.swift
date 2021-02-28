//
//  RecipeIngredients.swift
//  simplecook
//
//  Created by Conor Thorne on 18/02/2021.
//

import SwiftUI
import iPages

struct RecipeIngredients: View {
    var recipe: Recipe
    
    @State var trim : CGFloat = 0
    @State var checked = false
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    
    var body: some View {
        ScrollView{
            
            VStack {
                VStack(alignment:(.leading)){
                    
                    Text("ingredients")
                        .font(.title)
                        .offset(x:10)
                    
                    // allows button to be laid onto ingredient list
                    ZStack{
                        // display each recipe ingredient
                        CheckList(ingredients: recipe.ingredients)

                        // add to shopping list button
                        Button(action: {
                            modelData.shoppinglist.append(recipe)
                        }){
                            Image(systemName: "list.bullet")
                                .resizable()
                                .frame(width:30, height:30)
                        }
                        .offset(x:150, y:130)

                    }
                }
            }
            .padding()
            .frame(width: 380, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .shadow(radius: 7)
        
            
            
        }
    }
}

struct RecipeIngredients_Previews: PreviewProvider {
    static var recipes = ModelData().recipes

    static var previews: some View {
        RecipeIngredients(
            recipe : recipes[0]).environmentObject(ModelData())
    }
}





