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
    @State private var isTimer = false
    
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
                        
                        Spacer()
                    
                    }
                }
            }
            .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            VStack{
                Button(action: {
                   isTimer = true
                }
                ){
                    VStack{
                        Image(systemName: "timer")
                            .font(.largeTitle)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius:9)
                        Text("timer").font(.system(size:15.0)).foregroundColor(.blue)
                    }
                }
            }.offset(x:150,y:-80)
        }
        .edgesIgnoringSafeArea(.top)
        .background(EmptyView().sheet(isPresented: $isTimer) {
                // present edit mode using entire screen
            NavigationView{
                TimerView(timeRemaining: 60.0)
                    .navigationBarItems(leading:
                        Button(action: {
                            isTimer = false
                        }){
                            Text("Back")
                        }
                    )
                }
            .navigationTitle("timer")
            }
        )
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
    
    static var recipes = MyRecipeModel.data[1]
    
    static var previews: some View {
        CookingMode(recipe: recipes)
    }
}
