//
//  RecipeIngredients.swift
//  simplecook
//
//  Created by Conor Thorne on 18/02/2021.
//

import SwiftUI
import iPages

struct RecipeIngredients: View {
    
    @State var trim : CGFloat = 0
    @State var checked = false
    @State private var serving = 2
    @State private var count = 0;
    @State private var servingsize = 2; // keep count of how many servings are being displayed
    
    @State var isNutrition = false

    // state variables for dictionary search
    @State var isDictionary = false
    @State private var word = ""
    
    // recipe data
    @Binding var recipe: MyRecipeModel
    @Binding var shoppinglist : [MyShoppingData]
    @State private var data: MyRecipeModel.Data = MyRecipeModel.Data()
    var recipes : MyRecipeModel
    
    @State var serving_sizes : [Int]
        
    var body: some View {
        
        //NavigationView {
            VStack(alignment: .leading){
                // title and price
                HStack {
                    Text("ingredients").font(.title).padding()
                    Spacer()
                    HStack{
                        Image(systemName: "eurosign.circle")
                        Text("2")
                    }
                    .font(.title)
                    .padding()
                }
                VStack {
                    HStack {
                        VStack(alignment: .leading){
                                // recipe ingredient stepper
                                Stepper("\(serving)  servings", onIncrement: {
                                    serving += 1
                                    // increment all serving sizes
                                    for _ in serving_sizes {
                                        serving_sizes[count] = (recipe.servings[count])/2 + serving_sizes[count]
                                        count+=1
                                    }
                                    count = 0   // reset count
                                    servingsize+=1  // increase serving count
                                    }, onDecrement: {
                                        serving -= 1
                                        // decrement each serving size
                                        for _ in serving_sizes {
                                            serving_sizes[count] = serving_sizes[count] - (recipe.servings[count]/2)
                                            count+=1
                                        }
                                        count = 0   // reset count
                                        servingsize=servingsize-1
                                    })
                                    .padding(10)
                                    
                            // display ingredients
                            ForEach(Array(zip(recipes.ingredients, serving_sizes)), id: \.0){ ingredient in
                                HStack{
                                    // presented ingredient as button
                                    Button(action: {
                                        word = ingredient.0 // set dictionary search
                                        isDictionary = true // set full screen as dictionary
                                    }){
                                        Text(ingredient.0).underline(color:Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    }
                                    Spacer()
                                    let x : Int = ingredient.1  // convert int of serving into string to display
                                    let myString = String(x)
                                    Text(myString)  // servings
                                    }
                                .padding()
                            }
                        }
                    }
                    HStack{
                        // shopping list button
                        VStack {
                            AddShoppingListButton(shoppinglist:$shoppinglist, title:recipe.title, category: recipe.categoryName, ingredients:recipe.ingredients, servings:recipe.servings, imageName:recipe.imageName)
                            Text("add to shop list").font(.system(size:15.0)).foregroundColor(.blue)
                        }
                            
                        Spacer()
                        
                        Button(action: {
                           isNutrition = true
                        }){
                            VStack{
                                Image(systemName: "doc.text.magnifyingglass")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(20)                           // rounds corners
                                    .shadow(radius:9)
                                Text("nutrition").font(.system(size:15.0)).foregroundColor(.blue)
                            }
                        }
                        
                    }.padding()
                }
                .padding()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .foregroundColor(.black)                    // sets color of text
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)
          //  }
        }
            /*
        .fullScreenCover(isPresented:$isDictionary){
            NavigationView{
                DictionaryView(word:$word)
                    .navigationBarItems(leading:
                        Button(action: {
                            isDictionary = false
                        }){
                            Text("Back")
                        }
               )
            }
        }
 */
        .background(EmptyView().sheet(isPresented: $isDictionary) {
                // present edit mode using entire screen
            NavigationView{
                DictionaryView(word:$word)
                    .navigationBarItems(leading:
                        Button(action: {
                            isDictionary = false
                        }){
                            Text("Back")
                        }
                    )
                }
            .navigationTitle("dictionary")
            }
            .background(EmptyView().sheet(isPresented:$isNutrition){
                // present cooking mode
                NavigationView{
                    NutritionPage(ingredients:["garlic","tomatoes","basil","pasta"])
                        .navigationBarItems(leading:
                            Button(action: {
                                isNutrition = false
                            }){
                                Text("Back")
                            }
                        .navigationTitle("nutritional information")
                    )
                }
            }))
        
    }
}

struct RecipeIngredients_Previews: PreviewProvider {
    static var recipes = ModelData().recipes

    static var previews: some View {
        Group{
            RecipeIngredients(
                recipe: .constant(MyRecipeModel.data[2]), shoppinglist:.constant(ModelData().shoppinglist), recipes: MyRecipeModel.data[1], serving_sizes : (MyRecipeModel.data[1].servings))
        }
    }
}





