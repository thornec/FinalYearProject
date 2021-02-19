//
//  CategoryHome.swift
//  simplecook
//
//  Created by Conor Thorne on 18/02/2021.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
            NavigationView {
                List {
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                }
            }
        }
    }

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
