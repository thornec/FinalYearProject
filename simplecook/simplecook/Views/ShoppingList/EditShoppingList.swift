//
//  EditShoppingList.swift
//  simplecook
//
//  Created by Conor Thorne on 08/04/2021.
//

import SwiftUI

struct EditShoppingList: View {
    
    @Binding var recipeData : MyRecipeModel.Data    // passed from detail view
    @State private var newIngredient = ""   // hold new ingredient entered
    @State private var newStep = ""   // hold new step entered
    @State private var isSaved = false
    
    
    var body: some View {
        List {
            // recipe title
            Section(header: Text("Ingredient")) {
            HStack{
                    // include title string binding
                    TextField("Title", text: $recipeData.title)
                    Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                     /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        EditShoppingList(recipeData: .constant(MyRecipeModel.data[0].data))
    }
}
