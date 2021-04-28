//
//  nutritionButton.swift
//  simplecook
//
//  Created by Conor Thorne on 28/04/2021.
//

import SwiftUI

// view for nutrition button
struct nutritionButton: View {
    var body: some View {
        VStack{
            Image(systemName: "doc.text.magnifyingglass")
                .font(.largeTitle)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius:9)
            Text("nutrition").font(.system(size:15.0)).foregroundColor(.blue)
        }
    }
}

struct nutritionButton_Previews: PreviewProvider {
    static var previews: some View {
        nutritionButton()
    }
}
