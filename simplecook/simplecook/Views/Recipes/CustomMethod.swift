//
//  CustomMethod.swift
//  simplecook
//
//  Created by Conor Thorne on 11/03/2021.
//

import SwiftUI

struct CustomMethod: View {
    
    var stepcount = ["step one", "step two", "step three", "step four", "step five"]
    var recipe : Recipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                // iterate through step counts and steps in method
                ForEach(Array(zip(stepcount, recipe.method)), id: \.0){ step in
                    // step title
                    Text(step.0)
                        .padding()
                        .font(.subheadline)
                    // step details
                    Text(step.1)
                        .font(.title)
                }
            }
            .padding()
            .padding(.horizontal)                      // creates wide rectangle
            .background(Color.white)
            .foregroundColor(.black)                    // sets color of text
            .cornerRadius(20)                           // rounds corners
            .shadow(radius:9)
            .frame(width:400, height: 800)
        }
    }
}

struct CustomMethod_Previews: PreviewProvider {
    
    static var recipe = ModelData().recipes[0]

    static var previews: some View {
        CustomMethod(recipe : recipe).environmentObject(ModelData())
    }
}


