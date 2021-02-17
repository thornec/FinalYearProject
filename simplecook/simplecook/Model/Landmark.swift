//
//  Landmark.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//
import Foundation
import SwiftUI

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var price: String
    var cooktime: String
    var method: String
    var ingredients: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

}
