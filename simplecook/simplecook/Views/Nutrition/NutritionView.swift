//
//  NutritionView.swift
//  simplecook
//
//  Created by Conor Thorne on 31/03/2021.
//

import SwiftUI

struct NutritionView: View {
        @State var response : [Response] = []
        var query : String
        
        var body: some View {
            List(response) { item in
                // extract data values and sum
                let values = sumData(response : response[0])
                let display = extractData(item: values)
                
                // display data values
                NutritionList(values:display)
                
                }.onAppear {
                    API().loadData(query:query){ (data) in
                    response = [data]
            }
        }
    }
        func sumData(response : Response) -> Item {
            let count = response.items.count
            var counter = response.items[0]
            
            for item in 1..<(count) {
                counter.proteinG += response.items[item].proteinG
            }
            
            return counter
        }

        func extractData(item: Item) -> [String]{
                    
            let data = [  String(item.proteinG),
                          String(item.carbohydratesTotalG),
                          String(item.fatTotalG),
                          String(item.sugarG),
                          String(item.fiberG),
                          String(item.sodiumMg),
                          String(item.potassiumMg),
                          String(item.fatSaturatedG),
                          String(item.cholesterolMg)]
             
            return data
        }
    }


struct NutritionView_Previews: PreviewProvider {
    
    static var previews: some View {
        NutritionView(query:"garlic")
    }
}
