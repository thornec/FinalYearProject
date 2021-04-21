//
//  TimerView.swift
//  simplecook
//
//  Created by Conor Thorne on 09/04/2021.
//

import SwiftUI
import UIKit

class ViewController : UIViewController {
    
    @IBOutlet weak var label : UILabel!
    
    var timeLeft : Int = 10     // time left in timer
    var timer: Timer!
    
    // play timer
    @IBAction func playTapped(_ sender: Any){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    // pause timer
    @IBAction func pauseTapped(_ sender: Any){
        timer.invalidate()
    }
    
    // reset timer
    @IBAction func resetTapped(_ sender: Any){
        timer.invalidate()
        timeLeft = 10   // reset timer
        label.text = "\(timeLeft)"
    }
    
    @objc func step() {
        // subtract one from time remainng
        
        if timeLeft > 0 {
            timeLeft -= 1
        }
        else {
            timer.invalidate()
            timeLeft = 10   // reset timer
        }
        label.text = "\(timer)"
    }
    
    
}

let defaultTimeRemaining: CGFloat = 10
let lineWidth: CGFloat = 30
let radius: CGFloat = 70

struct TimerView: View {
    
    @State private var isActive = false     // is timer on
    @State private var timeRemaining : CGFloat = defaultTimeRemaining
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        // Clock Drawing
        VStack(spacing: 25) {
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth:lineWidth, lineCap: .round))
                Circle()
                    .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 1 - ((defaultTimeRemaining - timeRemaining) / defaultTimeRemaining))
                    .stroke(Color.green.opacity(0.9), style: StrokeStyle(lineWidth:lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                Text("\(Int(timeRemaining))")
                    .font(.title)
            }
            .frame(width:radius*2, height: radius*2)
            
            HStack(spacing:25) {
                Label("", systemImage: "play.circle")
                    //.font(.title)
                    .onTapGesture(perform: {
                        isActive = true
                    })
                
                Label("", systemImage: "pause.circle")
                    //.font(.title)
                    .onTapGesture(perform: {
                        isActive = false
                    })
                
                Label("", systemImage: "arrow.counterclockwise.circle")
                    //.font(.title)
                    .onTapGesture(perform: {
                        isActive = false
                        timeRemaining = defaultTimeRemaining
                    })
            }
            .font(.largeTitle)
        }
        .onReceive(timer, perform: { _ in
            // check if active
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else {
                isActive = false
                timeRemaining = defaultTimeRemaining
            }
        })
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
