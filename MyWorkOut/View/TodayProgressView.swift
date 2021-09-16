//
//  ProgressView.swift
//  MyWorkOut
//
//  Created by suthichai on 16/9/2564 BE.
//

import SwiftUI

struct TodayProgressView: View {
    private let history = HistoryStore()
    private let today = Date()
    var body: some View {
        ForEach(history.exerciseDays) { exercise in
            if Date() == exercise.date {
                ForEach(0..<exercise.exercises.count) { index in
                    Text(exercise.exercises[index])
                }
            }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TodayProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
