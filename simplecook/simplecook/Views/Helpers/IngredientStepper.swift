//
//  IngredientStepper.swift
//  simplecook
//
//  Created by Conor Thorne on 19/03/2021.
//

import SwiftUI

struct IngredientStepper: View {
    
    @State private var serving = 2

    var body: some View {
        VStack {
                Stepper("\(serving) servings", onIncrement: {
                    serving += 1
                }, onDecrement: {
                    serving -= 1
                })
            }
        .padding(30)
    }
}

struct IngredientStepper_Previews: PreviewProvider {
    static var previews: some View {
        IngredientStepper()
    }
}
