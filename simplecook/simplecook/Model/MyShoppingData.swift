//
//  MyShoppingData.swift
//  simplecook
//
//  Created by Conor Thorne on 08/04/2021.
//

import Foundation
import SwiftUI

struct MyShoppingData: Codable, Identifiable, Hashable {
    var id: UUID
    var title: String
    var category: String
    var ingredients: [String]
    var servings : [Int]
    // read in image
    var imageName: String
    
    // initalizer
    init(id: UUID = UUID(), title: String, category: String, ingredients: [String], servings: [Int], imageName: String) {
            // default values
            self.id = id
            self.title = title
            self.category = category
            self.ingredients = ingredients
            self.servings = servings
            self.imageName = imageName
    }
}


// data
extension MyShoppingData {
    static var data: [MyShoppingData] {
        [
            // poached eggs
            MyShoppingData(title:"poached eggs", category:"lunch", ingredients:["eggs"], servings:[2], imageName:"poachedeggs"),
            MyShoppingData(title:"poached eggs test", category:"lunch", ingredients:["eggs"], servings:[2], imageName:"poachedeggs")
        ]
    }
}

// editable data of shopping list item
extension MyShoppingData {
    struct Data {
        // assign default values
        var title: String = ""
        var ingredients : [String] = []
        var imageName: String = "myrecipe"
        var category: String = "Breakfast"
        var servings : [Int] = []
    }
    
    // return value
    var data : Data {
        return Data(title:title,imageName:imageName, category: category, servings:servings)
    }
    
    // update values from edit mode
    mutating func update(from data: Data) {
        title = data.title
        ingredients = data.ingredients
        category = data.category
        servings =  data.servings
    }
}

