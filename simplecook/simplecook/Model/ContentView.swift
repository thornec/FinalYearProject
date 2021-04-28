//
//  ContentView.swift
//  simplecook
//
//  Created by Conor Thorne on 16/02/2021.
//

import SwiftUI

// view primarily used for testing
struct ContentView: View {
    var body: some View {
        Text("testing")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData()) // makes test model data available
    }
}
