//
//  RecipeModel.swift
//  simplecook
//
//  Created by Conor Thorne on 22/03/2021.
//

import SwiftUI

struct MyRecipeModel {
    var title: String
    var ingredients : [String]
    var method : [String]
    var cost : Int
    var cooktime : Int
    
    var isCustom : Bool
    var isSaved : Bool
}

// test data
extension MyRecipeModel {
    static var data: [MyRecipeModel] {
        [
            // tomato sauce
            MyRecipeModel(title:"tomato sauce", ingredients: ["cherry tomatoes","garlic","olive oil","fresh basil"], method: ["add a few tablespoons of oil to a pan and turn on the gas to low heat, peel and slice the cloves of garlic and add to the pan","cook for 3 minutes until golden brown, then add the cherry tomatoes","cook on medium heat for about 7 minutes until the tomatoes are broken down into a sauce","add the chopped basil and seasoning andserve!"], cost: 1, cooktime: 10, isCustom: false, isSaved: false),
            // poached eggs
            MyRecipeModel(title:"poached eggs", ingredients: ["eggs"], method: ["bring a saucepan of water to a light simmer","crack the egg into a container and drop the egg using the container into the simmering water","placed a lid over the saucepan and leave the water simmer and poach the egg for 3/4 minutes","remove the egg from the water with a slotted spoon and plate!"], cost: 1, cooktime: 5, isCustom: false, isSaved: false)
        ]
    }
}
