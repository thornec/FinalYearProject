//
//  NutritionRow.swift
//  simplecook
//
//  Created by Conor Thorne on 29/03/2021.
//

import SwiftUI

struct NutritionRow: View {
    
    var nutrition : String
    var value : String
    
    var body: some View {
        VStack{
            Text(nutrition)
                .font(.headline)
                .padding()
            Divider()
            Text(value)
                .font(.subheadline)
                .padding()

        }
        .frame(width:90,height:80)
        .padding()
        .background(Color.white)
        .cornerRadius(20)                           // rounds corners
        .shadow(radius:9)
    }
}

struct NutritionRow_Previews: PreviewProvider {
    static var previews: some View {
        NutritionRow(nutrition: "Protein", value: "14.0")
    }
}
