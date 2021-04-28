//
//  InstructionView.swift
//  simplecook
//
//  Created by Conor Thorne on 09/04/2021.
//

import SwiftUI
import AVFoundation     // sound

struct InstructionView: View {
    
    var instruction : String
    @State private var time = 0.0
    @State private var number = 1
    
    var body: some View {
        VStack {
            
            
            
            // forward button
            Button(action: {}) {
                Image(systemName: "forward.fill")
            }
            .accessibilityLabel(Text("Skip 10 Seconds"))   // fast forward timer

        }
        .padding()
        .onAppear{
            scrumTimer.reset(lengthInMinutes: 5)    // reset timer
            scrumTimer.startScrum()
        }
    }
}


struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView(instruction: "it was 3 minutes past why then does it matter who")
    }
}
