//
//  RecipeMethod.swift
//  simplecook
//
//  Created by Conor Thorne on 25/02/2021.
//

import SwiftUI

struct RecipeMethod: View {
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
   
    var recipe: Recipe

    var body: some View {
        ScrollView{
            VStack(alignment : .leading) {
                    //step text
                    ForEach(Array(zip(recipe.method,recipe.method_images)), id: \.0){ step in
                        VStack {
                            MethodImage(image:step.1)
                            Text(step.0)
                                .padding()

                        }
                        .padding()
                    }

                }

        }

    }
}

struct RecipeMethod_Previews: PreviewProvider {
    static var recipe = ModelData().recipes[0]

    static var previews: some View {
        RecipeMethod(recipe : recipe).environmentObject(ModelData())

    }
}
