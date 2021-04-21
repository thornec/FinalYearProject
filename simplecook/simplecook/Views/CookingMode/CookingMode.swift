//
//  CookingMode.swift
//  simplecook
//
//  Created by Conor Thorne on 25/02/2021.
//

import SwiftUI
import iPages


struct CookingMode: View {
    
    var recipe: MyRecipeModel
    
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
                    
                        HStack{
                            Image(systemName: "mic.circle")
                                .resizable()
                                .frame(width:100, height:100)
                                .padding(.leading)
                                .offset(x:-60, y:-20)
                                //.background(Color.white)
                                //.foregroundColor(.black)                    // sets color of text
                                //.cornerRadius(20)                           // rounds corners
                                //.shadow(radius:9)
                            
                            TimerView()
                            
                            var timer_val = isTimerNeeded(sentence:step.0)
                            if(timer_val != 0){
                                TimerView()
                            }
                        }.padding()
            
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

// extract time from sentences
func isTimerNeeded(sentence : String) -> Int {
    var ret = 0 // return value
    let word_array = sentence.components(separatedBy: " ")
    
    // loop through words in instruction
    for word in word_array {
        // check if word is number
        if(Int(word) != nil){
            ret = Int(word)!  // set return value equal to number
        }
    }
    
    return ret
}

struct CookingMode_Previews: PreviewProvider {
    
    static var recipes = ModelData().recipes
    
    static var previews: some View {
        CookingMode(recipe: (MyRecipeModel.data[1]))
    }
}
