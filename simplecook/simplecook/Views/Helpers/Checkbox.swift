//
//  Checkbox.swift
//  simplecook
//
//  Created by Conor Thorne on 18/02/2021.
//

import SwiftUI

struct Checkbox: View {
    
    @Binding var checked : Bool  // is box ticked or not
    @Binding var trim : CGFloat // trim of outer box
    
    var animatedData: CGFloat {
        get {trim}
        set {trim = newValue}
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .frame(width: 70, height: 70)
                .foregroundColor(checked ? Color.green : Color.gray.opacity(0.2))
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: trim)
                .fill(checked ? Color.green : Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
            
            // check if box ticked
            if checked {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.white)
            }
        }
        
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(checked: .constant(false), trim:.constant(5))
    }
}
