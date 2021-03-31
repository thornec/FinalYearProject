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
        ScrollView{
            TabView {
                ForEach(Array(zip(recipe.method,recipe.method_images)), id: \.0){ step in
                    VStack {
                        CookingModeImage(image:step.1)
                            .edgesIgnoringSafeArea(.top)
                        Text(step.0)
                            .padding(50)
                            .font(.title)
                        Image(systemName: "mic")
                            .resizable()
                            .padding()
                            .frame(width:75, height:100)
                            .background(Color.white)
                            .foregroundColor(.black)                    // sets color of text
                            .cornerRadius(20)                           // rounds corners
                            .shadow(radius:9)
                        Spacer()
                    }
                }
            }
            .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct CookingMode_Previews: PreviewProvider {
    
    static var recipes = ModelData().recipes
    
    static var previews: some View {
        CookingMode(recipe : recipes[0])
    }
}
