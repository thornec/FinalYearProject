//
//  TimerHeader.swift
//  simplecook
//
//  Created by Conor Thorne on 09/04/2021.
//

import SwiftUI

struct TimerHeader: View {
    
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    // calculate progress of timer
    private var progress: Double {
            guard secondsRemaining > 0 else { return 1 }
            let totalSeconds = Double(secondsElapsed + secondsRemaining)
            return Double(secondsElapsed) / totalSeconds
    }
    
    // calculate minutes remaining used for voice over
    private var minutesRemaining: Int {
            secondsRemaining / 60
    }
    
    // calculate minute or minutes for voice over
    private var minutesRemainingMetric: String {
            minutesRemaining == 1 ? "minute" : "minutes"
        }
    
    var body: some View {
        VStack{
            ProgressView(value: progress)       // progress of timer

            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    HStack {
                        Text("\(secondsRemaining)")
                        Image(systemName: "hourglass.tophalf.fill")
                    }
                }
            }
        }
        .padding([.top, .horizontal])
        .accessibilityElement(children: .ignore)    // ignore reading hourglass labels
        .accessibilityLabel(Text("Time remaining"))
        .accessibilityValue(Text("\(minutesRemaining) \(minutesRemainingMetric)"))
    }
}

struct TimerHeader_Previews: PreviewProvider {
    static var previews: some View {
        TimerHeader(secondsElapsed: 60, secondsRemaining: 180)
    }
}
