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

    var body: some View {
    NavigationView{
        VStack{
            ForEach(modelData.shoppinglist, id:\.self){ item in
                    ShoppingRow(recipe : item)
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
        .fullScreenCover(isPresented: $isAddMode){
            // present add mode using entire screen
            NavigationView {
                Text("hello")
                    .navigationTitle("Create a New Recipe")
                    .navigationBarItems(leading: Button("Cancel") {
                        isAddMode = false          // return from adding
                    }, trailing: Button("Done") {
                        isAddMode = false          // return
                        //recipe.update(from: data)   // update values from edit
                    })
                }
            }
        }
    }
}

struct ShopList_Previews: PreviewProvider {

    static var previews: some View {
        ShopList().environmentObject(ModelData())

    }
}
