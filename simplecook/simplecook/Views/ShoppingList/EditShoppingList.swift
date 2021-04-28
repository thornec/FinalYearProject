//
//  EditShoppingList.swift
//  simplecook
//
//  Created by Conor Thorne on 08/04/2021.
//

import SwiftUI

// view for editing shopping list items
struct EditShoppingList: View {
    @Binding var newIngredient : String             // hold new ingredient entered
    // details to be entered by user
    @State var quantity = 0
    @State var ingredient = ""
    @State var selected = 0
    @State var selectedRecipe = 0
    @State var selectedMeasurement = ""
    
    @Binding var AddMode : Bool                     // is in add mode?
    @Binding var shoppinglist : [MyShoppingData]    // shopping data

    var body: some View {
        Form {
            // recipe title
            Section(header: Text("")) {
                VStack {
                    HStack{
                        // ingredient name
                        TextField("enter the ingredient", text: $ingredient)
                        // quantity
                        Stepper("\(quantity)", onIncrement: {
                            quantity+=1
                            newIngredient = "\(ingredient)\n\(quantity)\n\(selectedMeasurement)"
                        }, onDecrement: {
                            if(quantity==1){}
                            else {
                                quantity-=1
                            }
                            newIngredient = "\(ingredient)\n\(quantity)\n\(selectedMeasurement)"
                        }).padding()
                    }
                }
                // selecting measurement for item
                Picker(selection: $selected, label: Text(""), content: {
                                Text("Grams").tag(0)
                                Text("Kilos").tag(1)
                                Text("Milimeters").tag(2)
                                Text("Litres").tag(3)
                            }).pickerStyle(SegmentedPickerStyle())
            }
            // measurement picker
            Picker("Recipe", selection: $selectedRecipe){
                ForEach(shoppinglist, id: \.self){ item in
                    Text(item.title)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Button(action: {
                if(selected == 0){ self.selectedMeasurement = "Grams" }
                if(selected == 1){ self.selectedMeasurement = "Kilos" }
                if(selected == 2){ self.selectedMeasurement = "Milimeters" }
                if(selected == 3){ self.selectedMeasurement = "Litres" }
                // set bindings
                //newIngredient = "\(ingredient)\n\(quantity)\n\(selectedMeasurement)"
                newIngredient = "\(ingredient)"
                shoppinglist[selectedRecipe].ingredients.append(newIngredient)   // add new ingredient to list
                AddMode = false
            }){
                Text("Add").frame(maxWidth: .infinity, alignment:.center)
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditShoppingList_Previews: PreviewProvider {
    static var shoppinglist = ModelData().shoppinglist

    static var previews: some View {
        EditShoppingList(newIngredient:.constant(""), AddMode: .constant(true), shoppinglist : .constant(shoppinglist)).environmentObject(ModelData())
    }
}
