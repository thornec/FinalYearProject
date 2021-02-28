//
//  CookingMode.swift
//  simplecook
//
//  Created by Conor Thorne on 25/02/2021.
//

import SwiftUI
import iPages


struct CookingMode: View {

    var recipe : Recipe
    
    var body: some View {
        
        
        
        
        // steps of recipe
        iPages{
            ZStack{
                    Image("poachedeggs")
                    Text(recipe.method[0])
                }
            ZStack{
                    Image("poachedeggs")
                    Text(recipe.method[1])
                }
            ZStack{
                    Image("poachedeggs")
                    Text(recipe.method[2])
                }
            ZStack{
                    Image("poachedeggs")
                    Text(recipe.method[3])
                }
            
        }
        .dotsBackgroundStyle(.prominent)

        
            
        
    }
}

struct CookingMode_Previews: PreviewProvider {
    
    static var recipes = ModelData().recipes
    
    static var previews: some View {
        CookingMode(recipe : recipes[0])
    }
}
