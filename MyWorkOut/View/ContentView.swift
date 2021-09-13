//
//  ContentView.swift
//  MyWorkOut
//
//  Created by suthichai on 11/9/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = Exercise.exercise.count + 1
    var body: some View {
        let exerciseCount = Exercise.exercise.count
        TabView(selection : $selectedTab) {
            WelcomeView(selectedTab: $selectedTab).tag(exerciseCount + 1)
            ForEach(0..<exerciseCount) { index in
                ExerciseView(selectedTab: $selectedTab,index:index).tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
