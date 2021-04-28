//
//  Subview.swift
//  simplecook
//
//  Created by Conor Thorne on 28/04/2021.
//

import SwiftUI

struct Subview: View {
    
    var image : String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(image:"tacosstep1")
    }
}
