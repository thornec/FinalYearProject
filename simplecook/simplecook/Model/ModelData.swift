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
        "poached" : "poaching is a cooking technique that involves cooking by submerging food in a liquid, such as water, milk, stock or wine. poaching is particularly suitable for delicate food, such as eggs, poultry, fish and fruit, which might easily fall apart or dry out using other cooking methods. poaching is often considered a healthy method of cooking because it does not use fat to cook or flavor the food",
        "eggs" : "Eggs are laid by female animals of many different species, including birds, reptiles, amphibians, a few mammals, and fish, and many of these have been eaten by humans for thousands of years. Bird and reptile eggs consist of a protective eggshell, albumen, and vitellus, contained within various thin membranes",
        "apple cider vinegar": "Apple cider vinegar, or cider vinegar, is a vinegar made from fermented apple juice, and used in salad dressings, marinades, vinaigrettes, food preservatives, and chutneys.",
        "saucepan" : "A saucepan is a piece of cookware that's typically circular and metal with high sides and a long handle. Saucepans' high sides serve two purposes. The first (and obvious) purpose is that these high walls allow for more food and drink to fit inside the saucepan",
        "simmer" : "Simmering is a way to cook food gently and slowly. It's gentler than boiling but a little more aggressive than poaching. Simmering refers to cooking food in liquid, or even just cooking the liquid itself, at a temperature just below the boiling point",
        "slotted spoon": "A slotted spoon is a spoon implement used in food preparation. The term can be used to describe any spoon with slots, holes or other openings in the bowl of the spoon which let liquid pass through while preserving the larger solids on to",
        "onion":"A swollen edible bulb used as a vegetable, having a pungent taste and smell and composed of several concentric layers, they're versatile and can be used to heighten the flavor of any savory dish.",
        "garlic" : "Garlic is a plant in the Allium (onion) family. It is closely related to onions, shallots and leeks. Each segment of a garlic bulb is called a clove. There are about 10–20 cloves in a single bulb, give or take"
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
