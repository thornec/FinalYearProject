//
//  Landmark.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//
import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var price: String
    var cooktime: String
    var method: [String]
    var ingredients: [String]
    var servings: [Int]
    
    var isSaved: Bool
    var isCustom: Bool
    
    var method_images: [String]
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
    }
}
