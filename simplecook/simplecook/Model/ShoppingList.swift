//
//  ShoppingList.swift
//  simplecook
//
//  Created by Conor Thorne on 23/02/2021.
//


// used for defining structure of shopping list

import Foundation
import SwiftUI

struct ShoppingList: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: String
    var ingredients: [String]

    // read in image
    var imageName: String
    var image: Image {
        Image(imageName)    // load image from catalogue
    }
}


