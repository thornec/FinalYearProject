//
//  CircleImage.swift
//  Landmarks
//
//  Created by Conor Thorne on 05/02/2021.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
            Image("turtlerock") // image initalizer w/ file name
                .clipShape(Circle()) // clip circle
                .overlay(Circle().stroke(Color.white, lineWidth:4)) // overlay circle
                .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
