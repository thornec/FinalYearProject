//
//  ModelData.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import Foundation
import Combine

// model data is an observable object that holds the dictionary data, shopping list data and test recipe data used throughout the system
final class ModelData: ObservableObject {
    
    // dictionary data
    @Published var dictionaryEntries = [
        "poached" : "poaching is a cooking technique that involves cooking by submerging food in a liquid, such as water, milk, stock or wine. poaching is particularly suitable for delicate food, such as eggs, poultry, fish and fruit, which might easily fall apart or dry out using other cooking methods. poaching is often considered a healthy method of cooking because it does not use fat to cook or flavor the food",
        "eggs" : "Eggs are laid by female animals of many different species, including birds, reptiles, amphibians, a few mammals, and fish, and many of these have been eaten by humans for thousands of years. Bird and reptile eggs consist of a protective eggshell, albumen, and vitellus, contained within various thin membranes",
        "apple cider vinegar": "Apple cider vinegar, or cider vinegar, is a vinegar made from fermented apple juice, and used in salad dressings, marinades, vinaigrettes, food preservatives, and chutneys.",
        "saucepan" : "A saucepan is a piece of cookware that's typically circular and metal with high sides and a long handle. Saucepans' high sides serve two purposes. The first (and obvious) purpose is that these high walls allow for more food and drink to fit inside the saucepan",
        "simmer" : "Simmering is a way to cook food gently and slowly. It's gentler than boiling but a little more aggressive than poaching. Simmering refers to cooking food in liquid, or even just cooking the liquid itself, at a temperature just below the boiling point",
        "slotted spoon": "A slotted spoon is a spoon implement used in food preparation. The term can be used to describe any spoon with slots, holes or other openings in the bowl of the spoon which let liquid pass through while preserving the larger solids on to",
        "onion":"A swollen edible bulb used as a vegetable, having a pungent taste and smell and composed of several concentric layers, they're versatile and can be used to heighten the flavor of any savory dish.",
        "garlic" : "Garlic is a plant in the Allium (onion) family. It is closely related to onions, shallots and leeks. Each segment of a garlic bulb is called a clove. There are about 10–20 cloves in a single bulb, give or take",
        "all purpose flour" : "All-purpose flour is a versatile and general use wheat flour. It is milled from hard red wheat or a blend of hard and soft wheats, typically 80:20 ratio. As the name suggests, all-purpose flour is suitable for all types of baked goods such as bread, biscuits, pizza, cookies, muffins, etc",
        "salt" : "Salt is a mineral composed primarily of sodium chloride, a chemical compound belonging to the larger class of salts; salt in its natural form as a crystalline mineral is known as rock salt or halite. Salt is present in vast quantities in seawater, where it is the main mineral constituent.",
        "baking powder" : "Baking powder is a dry chemical leavening agent, a mixture of a carbonate or bicarbonate and a weak acid. The base and acid are prevented from reacting prematurely by the inclusion of a buffer such as cornstarch. Baking powder is used to increase the volume and lighten the texture of baked goods.",
        "vegetable oil" : "Vegetable oils, or vegetable fats, are oils extracted from seeds or from other parts of fruits. Like animal fats, vegetable fats are mixtures of triglycerides. Soybean oil, grape seed oil, and cocoa butter are examples of fats from seeds",
        "warm water" : "110°F is the standard in baking for warm water, which is 43 degrees celsius"
    ]
        
    // shopping list data
    @Published var shoppinglist : [MyShoppingData] = [MyShoppingData(title:"poached eggs", category:"lunch", ingredients:["eggs"], servings:[2], imageName:"poachedeggs")]

    // load test recipe data from json database into arrays
    @Published var recipes: [Recipe] = load("recipesData.json")

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


