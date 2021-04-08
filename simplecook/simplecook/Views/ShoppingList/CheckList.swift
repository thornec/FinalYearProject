//
//  CheckList.swift
//  simplecook
//
//  Created by Conor Thorne on 24/02/2021.
//

import SwiftUI

struct CheckList: View {
    var ingredients : [String]
    var recipe : MyShoppingData
    @Binding var shoppingData : [MyShoppingData]
    
    var body: some View {
        VStack(alignment:.leading) {
            // recipe image
            Section {
                HStack {
                    ShoppingImage(recipe: recipe)
                        .padding()
                    Text(recipe.title)
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

            RemoveItem(recipes: $shoppingData, recipe: recipe).padding(.leading,280)
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
    
    static var previews: some View {
        CheckList(ingredients : MyShoppingData.data[0].ingredients, recipe: MyShoppingData.data[0], shoppingData: .constant(MyShoppingData.data))
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

