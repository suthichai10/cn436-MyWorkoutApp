//
//  MyWorkOutApp.swift
//  MyWorkOut
//
//  Created by suthichai on 11/9/2564 BE.
//

import SwiftUI

@main
struct MyWorkOutApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HistoryStore())
        }
    }
}
