//
//  DictionaryEntry.swift
//  simplecook
//
//  Created by Conor Thorne on 12/03/2021.
//

import Foundation
import SwiftUI


struct Dict: Hashable, Codable, Identifiable {
    var id : Int
    var word : String
    var definition : String
}
