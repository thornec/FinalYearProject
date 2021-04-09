//
//  List.swift
//  simplecook
//
//  Created by Conor Thorne on 23/02/2021.
//

import SwiftUI
    
    
struct ShopList: View {
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    @State private var isAddMode = false
    @State var shoppinglist : [MyShoppingData]
    
    // placeholders for new data
    @State var newIngredient = ""
    @State var newQuantity = 0
    
    var body: some View {
    NavigationView{
        VStack{
            ForEach(shoppinglist, id:\.self){ item in
                    ShoppingRow(recipe : item, shoppingData: $shoppinglist)
                }
            Spacer()
            
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
                Text("hello")
                //EditShoppingList(newIngredient: $newIngredient, quantity: $newQuantity)
                    .navigationTitle("Add New Item")
                    .navigationBarItems(leading: Button("Cancel") {
                        isAddMode = false          // return from adding
                    }, trailing: Button("Add") {
                        // add new item
                        //let new = MyShoppingData(title: "TEST", category: "TEST", ingredients: [newIngredient], servings: [newQuantity], imageName: "TEST")
                        //shoppinglist.append(new) // push recipe onto list
                        //isAddMode = false         // exit add mode
                    })
                }
            }
        }
    }
}

struct ShopList_Previews: PreviewProvider {

    static var shoppinglist = ModelData().shoppinglist
    
    static var previews: some View {
        ShopList(shoppinglist : shoppinglist).environmentObject(ModelData())

    }
}
