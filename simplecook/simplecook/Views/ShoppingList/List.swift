//
//  List.swift
//  simplecook
//
//  Created by Conor Thorne on 23/02/2021.
//

import SwiftUI
    
    
struct ShopList: View {
    
    var body: some View {

        VStack{
            List(shoppinglist){ item in
                ShoppingRow(recipe : item)
            }
        }
        

    }
}

struct ShopList_Previews: PreviewProvider {
    
    static var previews: some View {
        ShopList()
    }
}
