//
//  RecipeIngredients.swift
//  simplecook
//
//  Created by Conor Thorne on 18/02/2021.
//

import SwiftUI
import iPages

struct RecipeIngredients: View {
    @State var recipe: Recipe
    
    @State var trim : CGFloat = 0
    @State var checked = false
    @State private var serving = 2
    @State private var count = 0;

    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    
    var body: some View {
        
        NavigationView{
            VStack{
                VStack(alignment: .leading){
                    
                    Stepper("\(serving)  servings", onIncrement: {
                        serving += 1
                        // increment all serving sizes
                        for i in recipe.servings {
                            recipe.servings[count] = recipe.servings[count] * 2
                            count+=1
                        }
                        
                        count = 0
                        
                    }, onDecrement: {
                        serving -= 1
                        
                        // decrement each serving size
                        for i in recipe.servings {
                            recipe.servings[count] = recipe.servings[count] / 2
                            count+=1
                        }
                        
                        count = 0
                    })
                    .padding(10)
                    
                    
                    ForEach(Array(zip(recipe.ingredients, recipe.servings)), id: \.0){ ingredient in
                        NavigationLink(destination:DictionaryView(word: "poached")){
                            HStack{
                                Text(ingredient.0)  // ingredients
                                Spacer()
                                var x : Int = ingredient.1  // convert int of serving into string to display
                                var myString = String(x)
                                Text(myString)  // servings
                            }
                        }
                    }
                    .padding()
                    //.offset(x:-110)

                    
                    // add to shopping list button
                    AddShoppingListButton(recipe:recipe)
                        .position(x:180, y:100)
                }
                .frame(width: 350, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)                      // creates wide rectangle
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .foregroundColor(.black)                    // sets color of text
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)
            }
            .navigationTitle("ingredients")
        }
        .frame(width:400, height:710)
    }
    
    
}

struct RecipeIngredients_Previews: PreviewProvider {
    static var recipes = ModelData().recipes

    static var previews: some View {
        RecipeIngredients(
            recipe : recipes[0]).environmentObject(ModelData())
    }
}





