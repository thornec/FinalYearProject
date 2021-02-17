//
//  simplecookApp.swift
//  simplecook
//
//  Created by Conor Thorne on 16/02/2021.
//

import SwiftUI

// app entry point
@main
struct simplecookApp: App {
    @StateObject private var modelData = ModelData()
    
    // returns scenes
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
