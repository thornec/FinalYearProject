//
//  CheckList.swift
//  simplecook
//
//  Created by Conor Thorne on 24/02/2021.
//

import SwiftUI

struct CheckList: View {
    var ingredients : [String]
    var recipe : Recipe
    var body: some View {
        VStack(alignment:.leading) {
            // recipe image
            Section {
                HStack {
                    ShoppingImage(recipe: recipe)
                        .padding()
                    Text(recipe.name)
                }
            }
            Divider()
            // convert ingredient list into checklist struct array
            let checklist = createList(ingredientslist: ingredients)
            ForEach(checklist, id: \.self){ item in
                HStack{
                    Text(item.title).padding()
                    Spacer()
                    CheckBox(checked: item.isChecked).padding()
                    }
                }

               RemoveItem(recipe: recipe).padding(.leading,280)
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .background(Color.white)
        .foregroundColor(.black)                    // sets color of text
        .cornerRadius(20)                           // rounds corners
        .shadow(radius:9)
        Spacer()
    }
}

struct CheckList_Previews: PreviewProvider {
    
    static var shoppinglist = ModelData().shoppinglist
    
    static var previews: some View {
        CheckList(ingredients : shoppinglist[0].ingredients, recipe: shoppinglist[0])
    }
}

struct checkListItem : Hashable {
    var isChecked : Bool = false     // default val false
    var title : String
}


// function to convert list of ingredients into checklist array
func createList(ingredientslist : [String]) -> [checkListItem] {
    var checklist = [checkListItem]()
    
    for item in ingredientslist {
        let check = checkListItem(title: item)
        checklist.append(check)
    }
    return checklist
}

