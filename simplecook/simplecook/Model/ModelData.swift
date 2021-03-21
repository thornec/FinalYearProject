//
//  ModelData.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import Foundation
import Combine

// recipes are of observable class to allow changes to be shown through relevant views
final class ModelData: ObservableObject {
    
    @Published var dictionaryEntries = [
        "poached" : "poaching is a cooking technique that involves cooking by submerging food in a liquid, such as water, milk, stock or wine. poaching is particularly suitable for delicate food, such as eggs, poultry, fish and fruit, which might easily fall apart or dry out using other cooking methods. poaching is often considered a healthy method of cooking because it does not use fat to cook or flavor the food"
        ]
    
    @Published var shoppinglist : [Recipe] = load("shoppinglistData.json")

    @Published var myrecipes : [Recipe] = load("MyRecipesData.json")

    // load data from database into arrays
    @Published var recipes: [Recipe] = load("recipesData.json")

    
    // categories dictionary
    var categories: [String: [Recipe]]{
        Dictionary(
        grouping: recipes,
            by: { $0.category.rawValue }
        )
    }
}


// load method fetches JSON data using filename
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
