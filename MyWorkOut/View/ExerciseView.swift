//
//  ExerciseView.swift
//  MyWorkOut
//
//  Created by suthichai on 13/9/2564 BE.
//

import SwiftUI
import AVKit

struct ExerciseView : View {
    @Binding var selectedTab : Int
    let index : Int
    var body : some View {
        GeometryReader { geometry in
            VStack {
                Text(Exercise.exercise[index].exerciseName)
                if let url = Bundle.main.url(forResource: Exercise.exercise[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(width: geometry.size.width , height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(Exercise.exercise[index].videoName).mp4")
                        .foregroundColor(.red)
                }
                Button("Next") {
                    selectedTab += 1
                }
            }
        }
    }
}

struct ExerciseView_Preview : PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1) , index: 0)
    }
}
