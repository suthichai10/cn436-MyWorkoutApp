//
//  ExerciseView.swift
//  MyWorkOut
//
//  Created by suthichai on 13/9/2564 BE.
//

import SwiftUI
import AVKit

struct ExerciseView : View {
    @EnvironmentObject private var history  : HistoryStore
    @State private var timerDone = false
    @State private var showTimer = false
    @State private var showHistory = false
    @State private var showSuccess = false
    @Binding var selectedTab : Int
    let index : Int
    var body : some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text(Exercise.exercise[index].exerciseName).font(.title)
                if let url = Bundle.main.url(forResource: Exercise.exercise[index].videoName, withExtension: "mp4") , let player = AVPlayer(url: url) {
                    VideoPlayer(player: player)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.45)
                    HStack {
                        Spacer()
                        Button(NSLocalizedString("Start", comment: "Start Button")) {
                            player.play()
                            showTimer = true
                        }.border(Color.black)
                        Spacer()
                        Button(NSLocalizedString("Done", comment: "Done Button")) {
                            history.addExercise(exercise: Exercise.exercise[index].exerciseName)
                            let today = history.getTodayExerciseData()
                            if today!.exercises.count != Exercise.exercise.count {
                                let index = history.getFirstIncompleteExerciseIndex()!
                                selectedTab = index
                                return
                            }
                            if selectedTab + 1 == Exercise.exercise.count {
                                showSuccess = true
                                return
                            }
                            selectedTab += 1
                        }
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .disabled(!timerDone)
                        Spacer()
                    }
                } else {
                    Text(NSLocalizedString("Couldn't find \(Exercise.exercise[index].videoName).mp4", comment: "Couldn't find video"))
                        .foregroundColor(.red)
                }
                Spacer()
                if showTimer {
                    TimerView(timerDone: $timerDone, timerFontSize: geometry.size.height * 0.15)
                } else {
                    Text("0")
                        .foregroundColor(.white)
                        .font(.system(size: geometry.size.height * 0.15,design: .rounded))
                }
                Spacer()
                RatingView(rating: AppStorage(wrappedValue:  0, "ratingForExercise\(index + 1)"))
                Spacer()
                FooterView(selectedTab:$selectedTab , showHistory: $showHistory)
                    .environmentObject(history)
            }
            .fullScreenCover(isPresented: $showHistory) {
                HistoryView()
                    .environmentObject(history)
            }
            .fullScreenCover(isPresented: $showSuccess) {
                SuccessView(selectedTab: $selectedTab)
            }
        }
    }
}

struct ExerciseView_Preview : PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1) , index: 0)
            .environmentObject(HistoryStore())
    }
}
