//
//  RecipeMethod.swift
//  simplecook
//
//  Created by Conor Thorne on 25/02/2021.
//

import SwiftUI

struct RecipeMethod: View {
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    var step: String
    var image_string: String

    var body: some View {
        
        ScrollView{
            VStack(alignment : .leading) {
                
                // step title
                
                
                Spacer()
                
                VStack{
                    // step image
                    MethodImage(image : image_string)
                    
                    //Spacer()
                    
                    //step text
                    Text(step)
                    
                    Spacer()
                }

            
                //ForEach(recipe.method, id: \.self){ step in
                  //  Text(step)
                //}
                //.padding()

            }
            .frame(width: 320, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .border(Color.black.opacity(0.1))
            .shadow(radius: 7)
        }

    }
}

struct RecipeMethod_Previews: PreviewProvider {
    static var step = ModelData().recipes[0].method[1]

    static var previews: some View {
        RecipeMethod(step : step, image_string : "step2").environmentObject(ModelData())

    }
}
