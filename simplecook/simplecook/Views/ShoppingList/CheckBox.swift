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
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.gray)

                    if checked {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.black)
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
