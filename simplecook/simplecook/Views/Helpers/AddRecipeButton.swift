//
//  AddRecipeButton.swift
//  simplecook
//
//  Created by Conor Thorne on 08/03/2021.
//

import SwiftUI

struct AddRecipeButton: View {
    var body: some View {
        Image(systemName: "plus.circle")
            .font(.system(size:90))
    }
}

struct AddRecipeButton_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeButton()
    }
}
