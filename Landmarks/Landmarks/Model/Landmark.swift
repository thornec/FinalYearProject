//
//  Landmark.swift
//  Landmarks
//
//  Created by Conor Thorne on 07/02/2021.
//

import Foundation
import SwiftUI
import CoreLocation

// landmark stucture
struct Landmark: Hashable, Codable {
    // values 
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // image name
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    // useful for interacting with mapkit framework
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longtitude
        )
    }
    
    // map coordinates
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longtitude: Double
    }
}
