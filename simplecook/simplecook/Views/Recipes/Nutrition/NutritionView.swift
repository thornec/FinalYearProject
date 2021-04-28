//
//  NutritionView.swift
//  simplecook
//
//  Created by Conor Thorne on 31/03/2021.
//

import SwiftUI

// view which calls api class function loadData and handles visualising data response
struct NutritionView: View {
        @State var response : [Response] = []       // hold response from api call
        var query : String                          // query to add to api call
            
        var body: some View {
            VStack {
                // handle response
                List(response) { item in
                    // extract data values and sum
                    let values = sumData(response : response[0])
                    let display = extractData(item: values)
                    
                    // display data values
                    NutritionList(values:display, query:query)
                    
                    }
                    // when view is appearing, make api call
                    .onAppear {
                        API().loadData(query:query){ (data) in
                        response = [data]   // load data response into state variable
                }
            }
        }
        .frame(width:450, height:250)       // fix frame size
    }
    
    // function used to extract values from response into string array
    func sumData(response : Response) -> Item {
            let count = response.items.count
            var counter = response.items[0]
            
            for item in 1..<(count) {
                counter.proteinG += response.items[item].proteinG
            }
            return counter
        }

    // extract data from response into a string array to be displayed
    func extractData(item: Item) -> [String]{
            // create string array using values from response
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
        NutritionView(query:"oil")
    }
}
