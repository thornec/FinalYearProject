//
//  MethodImage.swift
//  simplecook
//
//  Created by Conor Thorne on 25/02/2021.
//

import SwiftUI

struct MethodImage: View {
    
    var image : String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width:300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
            .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct MethodImage_Previews: PreviewProvider {
    static var previews: some View {
        MethodImage(image : "step1")
    }
}
