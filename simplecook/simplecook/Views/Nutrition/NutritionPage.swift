//
//  NutritionPage.swift
//  simplecook
//
//  Created by Conor Thorne on 14/04/2021.
//

import SwiftUI

struct NutritionPage: View {
    
    var ingredients : [String]
    
    var body: some View {
        VStack(alignment:.leading) {
                Text("nutrition")
                    .bold()
                    .font(.title)
                    .padding(30)
                
                Divider()
                
                ScrollView {
                    ForEach(ingredients, id:\.self){ ingredient in
                        VStack{
                            NutritionView(query:ingredient).frame(width:450,height:200)
                        }
                }
            }
        }
        .padding(.horizontal)                      // creates wide rectangle
        .background(Color.white)
        .foregroundColor(.black)                    // sets color of text
        .cornerRadius(60)                           // rounds corners
        .shadow(radius:9)
        .padding(20)
    }
}

struct NutritionPage_Previews: PreviewProvider {
    static var previews: some View {
        NutritionPage(ingredients: ["eggs", "garlic", "tomatoes", "basil","eggs"])
    }
}
