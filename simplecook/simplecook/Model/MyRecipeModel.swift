//
//  RecipeModel.swift
//  simplecook
//
//  Created by Conor Thorne on 22/03/2021.
//

import SwiftUI

struct MyRecipeModel : Identifiable, Codable {
    let id: UUID
    var title: String
    var ingredients : [String]
    var method : [String]
    var cost : Int
    var cooktime : Int
    var imageName : String
    var categoryName : String
    var servings : [Int]
    var method_images: [String]

    var isCustom : Bool
    var isSaved : Bool
    
    // initalizer
    init(id: UUID = UUID(), title: String, ingredients: [String], method: [String], cost: Int, cooktime: Int, imageName: String,isCustom: Bool, categoryName: String, servings: [Int], method_images:[String], isSaved: Bool) {
            // default values
            self.id = id
            self.title = title
            self.ingredients = ingredients
            self.method = method
            self.cost = cost
            self.cooktime = cooktime
            self.imageName = imageName
            self.categoryName = categoryName
            self.servings = servings
            self.method_images = method_images
            self.isCustom = isCustom
            self.isSaved = isSaved
    }
}

// data
extension MyRecipeModel {
    static var data: [MyRecipeModel] {
        [
            // poached eggs
            MyRecipeModel(title:"poached eggs", ingredients: ["eggs"], method: ["bring a saucepan of water to a light simmer","crack the egg into a container and drop the egg using the container into the simmering water","placed a lid over the saucepan and leave the water simmer and poach the egg for 3/4 minutes","remove the egg from the water with a slotted spoon and plate!"], cost: 1, cooktime: 5, imageName: "poachedeggs", isCustom: false, categoryName: "Breakfast", servings: [10, 3, 100, 5], method_images:["step1","step2","step3","step4"], isSaved: false),
            // tomato sauce
            MyRecipeModel(title:"tomato sauce", ingredients: ["cherry tomatoes","garlic","olive oil","fresh basil"], method: ["add a few tablespoons of oil to a pan and turn on the gas to low heat, peel and slice the cloves of garlic and add to the pan","cook for 3 minutes until golden brown, then add the cherry tomatoes","cook on medium heat for about 7 minutes until the tomatoes are broken down into a sauce","add the chopped basil and seasoning andserve!"], cost: 1, cooktime: 10, imageName : "ts", isCustom: false, categoryName: "Lunch", servings: [10, 3, 100, 5], method_images :["tsstep1","tsstep2","tsstep3","tsstep4"], isSaved: false),
            //  pasta pesto
            MyRecipeModel(title:"pasta pesto", ingredients: ["pasta","parmigiano","basil","olive oil","garlic","pine nuts"], method: ["bring a pot of water to the boil, mix the salt into the water and add the pasta","stir the pasta into the pasta and cook for around 8 minutes","remove the pasta from the water","add the basil, pine nuts, cheese, salt and pepper to the blender and blitz, slowly adding the oil","mix the pesto into the pasta","plate!"], cost: 1, cooktime: 10, imageName : "pastapesto-1", isCustom: false, categoryName: "Dinner", servings: [10, 3, 100, 5], method_images :["ppstep1","ppstep2","ppstep3","ppstep4","ppstep5","ppstep6"], isSaved: false),
        ]
    }
}


// editable data of recipe
extension MyRecipeModel {
    struct Data {
        // assign default values
        var title: String = ""
        var ingredients : [String] = []
        var method: [String] = []
        var cost: Int = 1
        var cooktime: Int = 10
        var imageName: String = "myrecipe"
        var categoryName: String = "Breakfast"
        var servings : [Int] = []
        var isCustom: Bool = true
        var isSaved: Bool = false
    }
    
    // return value
    var data : Data {
        return Data(title:title, ingredients:ingredients, method:method, cost:cost, cooktime:cooktime, imageName:imageName, categoryName: categoryName, servings:servings, isCustom:isCustom, isSaved:isSaved)
    }
    
    // update values from edit mode
    mutating func update(from data: Data) {
        title = data.title
        ingredients = data.ingredients
        method = data.method
        cooktime = data.cooktime
        cost = data.cost
        categoryName = data.categoryName
        servings =  data.servings
    }
}
