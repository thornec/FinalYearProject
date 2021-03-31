//
//  NutritionList.swift
//  simplecook
//
//  Created by Conor Thorne on 29/03/2021.
//

import SwiftUI

struct NutritionList: View {
    
    let info = [ "Protein",
                           "Carb",
                           "Fat",
                           "Sugars",
                           "Fiber",
                           "Sodium",
                           "Potassium",
                           "Saturated Fats",
                           "Cholestrol"
    ]
    
    var values : [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            // list of nutritional info
            ScrollView(.horizontal, showsIndicators: true){
                HStack{
                    ForEach(Array(zip(info, values)), id: \.0){ key in
                        NutritionRow(nutrition: key.0, value: key.1)
                    }
                }
                .padding()
            }
        }
    }
}



struct NutritionList_Previews: PreviewProvider {
    static var previews: some View {
        // test data
        let  values_test = [ "14.0","12.1","4.1","15.9","14.0","24.0","54.0","14.0","14.0"]
        
        NutritionList(values: values_test)
    }
}
