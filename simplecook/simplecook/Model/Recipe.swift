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
    var method: String
    var ingredients: String
    var isSaved: Bool
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }

}
