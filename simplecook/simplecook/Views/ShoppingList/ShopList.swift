//
//  List.swift
//  simplecook
//
//  Created by Conor Thorne on 23/02/2021.
//

import SwiftUI
    
// view for shopping list tab
struct ShopList: View {
    @EnvironmentObject var modelData: ModelData     // model data
    @State var isAddMode = false                    // add mode
    @Binding var shoppinglist : [MyShoppingData]    // shopping list data
    
    // placeholders for new data
    @State var newIngredient = ""
    @State var newQuantity = 0
    
    var body: some View {
    NavigationView{
        ScrollView {
            VStack{
                // display each shopping list item
                ForEach(shoppinglist, id:\.self){ item in
                        ShoppingRow(recipe : item, shoppingData: $shoppinglist)
                }
                Spacer()    // push to top
            }
            .padding()
            .navigationBarTitle("Shopping List")
            // add recipe shopping item
            .navigationBarItems(trailing: Button(action: {
                isAddMode = true                            // user has entered add recipe mode
            }) {
                Image(systemName: "plus")                   // add a new recipe
                    .font(.title)
            })
            // cover screen in add recipe mode
            .sheet(isPresented: $isAddMode){
                // present add mode using entire screen
                NavigationView {
                    EditShoppingList(newIngredient: $newIngredient, AddMode: $isAddMode, shoppinglist:$shoppinglist)
                        .navigationTitle("Add New Item")
                        .navigationBarItems(leading: Button("Cancel") {
                        isAddMode = false          // return from adding
                        })
                    }
                }
            }
        }
    }
}

struct ShopList_Previews: PreviewProvider {
    static var shoppinglist = ModelData().shoppinglist
    static var previews: some View {
        ShopList(shoppinglist : .constant(shoppinglist)).environmentObject(ModelData())

    }
}
