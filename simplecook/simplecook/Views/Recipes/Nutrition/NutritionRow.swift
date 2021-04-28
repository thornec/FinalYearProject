//
//  NutritionRow.swift
//  simplecook
//
//  Created by Conor Thorne on 29/03/2021.
//

import SwiftUI

// view for one item that makes up the items in a nutritional list
struct NutritionRow: View {
    var nutrition : String      // key
    var value : String          // value
    
    var body: some View {
        VStack{
            // key
            Text(nutrition)
                .font(.headline)
                .padding()
            
            Divider()           // line
            // value
            Text(value)
                .font(.subheadline)
                .padding()

        }
        .frame(width:90,height:80)                  // fixed frame
        .padding()
        .background(Color.white)                    // color of square
        .cornerRadius(20)                           // rounds corners
        .shadow(radius:9)                           // add shadow
    }
}

struct NutritionRow_Previews: PreviewProvider {
    static var previews: some View {
        NutritionRow(nutrition: "Protein", value: "14.0")
    }
}
