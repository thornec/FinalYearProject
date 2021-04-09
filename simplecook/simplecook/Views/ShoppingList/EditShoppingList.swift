//
//  EditShoppingList.swift
//  simplecook
//
//  Created by Conor Thorne on 08/04/2021.
//

import SwiftUI

struct EditShoppingList: View {
    
    @Binding var newIngredient : String // hold new ingredient entered
    @Binding var quantity : Int // hold new ingredient entered
    @State var ingredientdisplay = ""
    
    
    var body: some View {
        List {
            // recipe title
            Section(header: Text("")) {
            HStack{
                TextField("enter the ingredient", text: $ingredientdisplay)
                    
                Stepper("\(quantity)", onIncrement: {
                    quantity+=1
                }, onDecrement: {
                    quantity-=1
                }).padding()
                    
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        EditShoppingList(newIngredient:.constant(""), quantity:.constant(0))
    }
}
