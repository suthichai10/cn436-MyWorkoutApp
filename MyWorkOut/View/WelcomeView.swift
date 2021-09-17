//
//  WelcomeView.swift
//  MyWorkOut
//
//  Created by suthichai on 13/9/2564 BE.
//

import SwiftUI

struct WelcomeView : View {
    @EnvironmentObject private var history : HistoryStore
    @State private var showTodayProgress = false
    @Binding var selectedTab : Int
    var body : some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Text(NSLocalizedString("Get fit", comment: "Title")).font(.largeTitle)
                        Text(NSLocalizedString("with high intensity interval training", comment: "Content"))
                    }
                    Spacer()
                    VStack(alignment:.center) {
                        Spacer()
                        Text(NSLocalizedString("Welcome", comment: "Welcome Text")).font(.largeTitle).bold()
                        Image("workout")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.3)
                        Spacer()
                    }
                    Spacer()
                }
                VStack(alignment:.center) {
                    let today = history.getTodayExerciseData()
                    let todayExercise = today?.exercises.count
                    Button(NSLocalizedString("Get Start", comment: "Go Workout")) {
                        selectedTab = 0
                    }.font(.largeTitle)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    ProgressView(NSLocalizedString("Today Progress :", comment: "Exercise Progress") + " \(todayExercise ?? 0) / \(Exercise.exercise.count)",value: Float(todayExercise ?? 0) , total:Float(Exercise.exercise.count))
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.3).onTapGesture {
                            showTodayProgress = true
                        }
                }
                .fullScreenCover(isPresented: $showTodayProgress) {
                    TodayProgressView()
                        .environmentObject(history)
                }
            }
        }
    }
}

struct WelcomeView_Previews : PreviewProvider {
    static var previews : some View {
        WelcomeView(selectedTab: .constant(0))
            .environmentObject(HistoryStore())
    }
}
