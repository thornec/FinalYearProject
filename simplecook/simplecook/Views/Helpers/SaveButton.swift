//
//  SaveButton.swift
//  simplecook
//
//  Created by Conor Thorne on 17/02/2021.
//

import SwiftUI

struct SaveButton: View {
    
    @Binding var isSet: Bool    // indicates button current state
    
    var body: some View {
        // button which performs relevant action depending on set of toggle
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill": "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(isSet: .constant(true))
    }
}
