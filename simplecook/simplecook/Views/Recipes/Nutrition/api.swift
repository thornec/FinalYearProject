//
//  TestView.swift
//  simplecook
//
//  Created by Conor Thorne on 23/03/2021.
//

import SwiftUI
import Foundation

// structure of response from api call
struct Response: Codable, Identifiable {
    let items: [Item]
    let id = UUID()
}

// structure of response item
struct Item: Codable {
    
    var sugarG, fiberG, servingSizeG, sodiumMg: Double
    var name: String
    var potassiumMg, fatSaturatedG: Double
    var fatTotalG, calories: Double
    var cholesterolMg: Double
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
        print("making request..." + query)
        // request
        let urlstring = "https://api.calorieninjas.com/v1/nutrition?query=" + query
        let urlNew:String = urlstring.replacingOccurrences(of: " ", with: "%20")        // remove spaces
        let myurl = URL(string:urlNew)                                                  // set url
        print("url request made with query")
        
        // make request
        if let unwrappedURL = myurl {
            var request = URLRequest(url: unwrappedURL)
            request.addValue("LRooJU3YQJPQMqVaaQjbHQ==xbZoAPJcBDmrAacW", forHTTPHeaderField: "X-Api-Key")   // add key to request
            
            // start url session with request
            let dataTask = URLSession.shared.dataTask(with: request){ (data, response, error) in
                print("trying to retrieve data now...")
                    let data = try! JSONDecoder().decode(Response.self, from: data!)
                    // data retrieved
                    DispatchQueue.main.async {
                        print("data sucessfully retrieved...")
                        completion(data)
                        print("response from server: " + "\(data)"  )
                    }

                }
                dataTask.resume()   // continue request
            }
        }
    }

