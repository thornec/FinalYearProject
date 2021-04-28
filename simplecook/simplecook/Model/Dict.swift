//
//  DictionaryEntry.swift
//  simplecook
//
//  Created by Conor Thorne on 12/03/2021.
//

import Foundation
import SwiftUI

// dictionary object structure
struct Dict: Hashable, Codable, Identifiable {
    var id : Int
    var word : String           // key
    var definition : String     // value
}

