//
//  TestView.swift
//  simplecook
//
//  Created by Conor Thorne on 23/03/2021.
//

import SwiftUI

struct TestView: View {
    @State var color = Color.red.opacity(0.4)
      @State var direction = ""
    @State var startPos : CGPoint = .zero
       @State var isSwipping = true
    
      var body: some View {
            ZStack {
                color
                Text(direction)
                    .font(.system(size: 30))
                    .bold()
            }.gesture(DragGesture()
              .onChanged { gesture in
                if self.isSwipping {
                                self.startPos = gesture.location
                                self.isSwipping.toggle()
                            }
              }
              .onEnded { gesture in
                let xDist =  abs(gesture.location.x - self.startPos.x)
                            let yDist =  abs(gesture.location.y - self.startPos.y)
                            if self.startPos.y <  gesture.location.y && yDist > xDist {
                                self.direction = "Down"
                                self.color = Color.green.opacity(0.4)
                            }
                            else if self.startPos.y >  gesture.location.y && yDist > xDist {
                                self.direction = "Up"
                                self.color = Color.blue.opacity(0.4)
                            }
                            else if self.startPos.x > gesture.location.x && yDist < xDist {
                                self.direction = "Left"
                                self.color = Color.yellow.opacity(0.4)
                            }
                            else if self.startPos.x < gesture.location.x && yDist < xDist {
                                self.direction = "Right"
                                self.color = Color.purple.opacity(0.4)
                            }
                            self.isSwipping.toggle()
                            }
           )
       }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
