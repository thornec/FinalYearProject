//
//  CheckBox.swift
//  simplecook
//
//  Created by Conor Thorne on 24/02/2021.
//

import SwiftUI

struct CheckBox: View {
    
    //var checked : Bool

    @State var checked = false
    
    var body: some View {
        
        ZStack {
            
            Button(action: {
                checked.toggle()
            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .frame(width: 30, height: 30)
                    if checked {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.white)
                    }
                }
                
            }
                
        }
        
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox()
    }
}
