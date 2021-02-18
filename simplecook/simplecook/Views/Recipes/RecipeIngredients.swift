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
    
    var body: some View {
        iPages {
            VStack(alignment:(.leading)){
                // display each recipe ingredient
                ForEach(recipe.ingredients, id: \.self){ ingredient in
                    HStack{
                        Text(ingredient)
                            .offset(x:30)
                        
                        Spacer()
                        
                        Button(action: {
                            if !self.checked {
                                withAnimation(Animation.easeIn(duration: 0.4)){
                                    self.trim = 1
                                    self.checked.toggle()
                                }
                            }
                            else {
                                withAnimation{
                                    self.trim = 0
                                    self.checked.toggle()
                                }
                            }
                        })
                        {
                            Checkbox(checked: $checked, trim: $trim)
                        }
                    }
                    .padding()
                    
                    Divider()
                        
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            VStack{
                Text(recipe.method)
            }
        }
        .dotsBackgroundStyle(.prominent)
        .padding()
        .frame(width: 390, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        //.overlay(Square.stroke(Color.white, lineWidth: 4))
        .shadow(radius: 7)
    
        
        
    }
    
}

struct RecipeIngredients_Previews: PreviewProvider {
    static var recipes = ModelData().recipes

    static var previews: some View {
        RecipeIngredients(recipe: recipes[0])
    }
}





