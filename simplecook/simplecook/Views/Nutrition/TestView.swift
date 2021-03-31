//
//  TestView.swift
//  simplecook
//
//  Created by Conor Thorne on 23/03/2021.
//

import SwiftUI
import Foundation

// MARK: - Welcome
struct Response: Codable, Identifiable {
    let items: [Item]
    let id = UUID()
}

// MARK: - Item
struct Item: Codable {
    
    var sugarG, fiberG, servingSizeG, sodiumMg: Int
    var name: String
    var potassiumMg, fatSaturatedG: Int
    var fatTotalG, calories: Double
    var cholesterolMg: Int
    var proteinG, carbohydratesTotalG: Double

    enum CodingKeys: String, CodingKey {
        case sugarG = "sugar_g"
        case fiberG = "fiber_g"
        case servingSizeG = "serving_size_g"
        case sodiumMg = "sodium_mg"
        case name
        case potassiumMg = "potassium_mg"
        case fatSaturatedG = "fat_saturated_g"
        case fatTotalG = "fat_total_g"
        case calories
        case cholesterolMg = "cholesterol_mg"
        case proteinG = "protein_g"
        case carbohydratesTotalG = "carbohydrates_total_g"
    }
}

class API {
    // load api data
    func loadData(query: String, completion: @escaping (Response) -> ()){
            let myurl = URL(string: "https://api.calorieninjas.com/v1/nutrition?query=" + query)

            if let unwrappedURL = myurl {
                var request = URLRequest(url: unwrappedURL)
                request.addValue("LRooJU3YQJPQMqVaaQjbHQ==xbZoAPJcBDmrAacW", forHTTPHeaderField: "X-Api-Key")
                
                let dataTask = URLSession.shared.dataTask(with: request){ (data, response, error) in
                    let data = try! JSONDecoder().decode(Response.self, from: data!)
                    
                    DispatchQueue.main.async {
                        completion(data)
                    }

                }
                    dataTask.resume()
                }
            }
        }

