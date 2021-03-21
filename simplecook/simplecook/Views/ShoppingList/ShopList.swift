//
//  List.swift
//  simplecook
//
//  Created by Conor Thorne on 23/02/2021.
//

import SwiftUI
    
    
struct ShopList: View {
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically

    var body: some View {

        ScrollView{
            VStack{
                ForEach(modelData.shoppinglist, id:\.self){ item in
                        ShoppingRow(recipe : item)
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
