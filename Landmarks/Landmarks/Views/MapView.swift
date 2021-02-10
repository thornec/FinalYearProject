//
//  MapView.swift
//  Landmarks
//
//  Created by Conor Thorne on 05/02/2021.
//

import SwiftUI
import MapKit       // import map kit functionality

struct MapView: View {
    // private state variable to hold region info for map
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    var body: some View {
        // map view
        Map(coordinateRegion: $region)  // prefixed state variable w/ $ passes a binding (reference to the underlying value)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
