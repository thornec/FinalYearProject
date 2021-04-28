//
//  NutritionPage.swift
//  simplecook
//
//  Created by Conor Thorne on 14/04/2021.
//

import SwiftUI

// view that is called, combines nutrition sub views together to create nutrition page
struct NutritionPage: View {
    // ingredients from recipe, used for query
    var ingredients : [String]
    
    var body: some View {
        VStack(alignment:.leading) {
            // page nav bar header
            Text("nutrition")
                    .bold()
                    .font(.title)
                    .padding(30)
                
            Divider()
            
            // scroll view
            ScrollView {
                // iterate through ingredients and make api call for nutritional info for each one
                ForEach(ingredients, id:\.self){ ingredient in
                    VStack{
                        // display results in a row
                        NutritionView(query:ingredient).frame(width:400,height:250)
                    }
                }
            }
        }
        .padding(.horizontal)                      // creates wide rectangle
        .background(Color.white)                   // sets color of square
        .foregroundColor(.black)                   // sets color of text
        .cornerRadius(60)                          // rounds corners
        .shadow(radius:9)                          // add shadow
        .padding(20)                               // gives space to components
    }
}

struct NutritionPage_Previews: PreviewProvider {
    static var previews: some View {
        NutritionPage(ingredients: ["eggs", "garlic", "tomatoes", "basil","eggs"])  // test data
    }
}
