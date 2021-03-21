//
//  MyRecipes.swift
//  simplecook
//
//  Created by Conor Thorne on 08/03/2021.
//

import SwiftUI

struct MyRecipes: View {
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically

    var body: some View {
        VStack{
            NavigationView{
                // list recipes in myrecipes json
                List(){
                    ForEach(modelData.recipes, id: \.self){ recipe in
                        // navigation link to recipe's details page
                        NavigationLink(destination: RecipeDetails(recipe: recipe)){
                            RecipeRow(recipe: recipe)
                        }
                    }
                                            
                    // navigation link to add a new recipe
                    NavigationLink(destination: AddRecipe(myrecipes:modelData.myrecipes)){
                        AddRecipeButton()
                    }
                    .offset(x:130)
                    

                }
                .navigationTitle("My Recipes")
                
                
            }

        }
    }
        
}

struct MyRecipes_Previews: PreviewProvider {
        
    static var previews: some View {
        MyRecipes().environmentObject(ModelData())
    }
}


//
//  DictionaryView.swift
//  simplecook
//
//  Created by Conor Thorne on 12/03/2021.
//
/*
import SwiftUI

struct DictionaryView: View {
    
    var thisword : String
    

    var body: some View {
        VStack(alignment: .leading){
            Text("dictionary")
                .bold()
                .font(.title)
            
            Divider()
            
            Text(thisword)
                .italic()
                .font(.title2)
            
            Divider()
            
           // Text(modelData.dictionary[0].word)
        }
        .padding(20)
        .frame(width:350,height:400)
        .padding(.horizontal)                      // creates wide rectangle
        .background(Color.white)
        .foregroundColor(.black)                    // sets color of text
        .cornerRadius(20)                           // rounds corners
        .shadow(radius:9)
        

    }
}

struct DictionaryView_Previews: PreviewProvider {
    
    static let thisword = ModelData().recipes
    

    static var previews: some View {
        DictionaryView(thisword: thisword[0].name)

    }
}
*/
