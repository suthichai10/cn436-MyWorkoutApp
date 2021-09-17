//
//  HistoryStroreDevData.swift
//  MyWorkOut
//
//  Created by suthichai on 15/9/2564 BE.
//

import SwiftUI

extension HistoryStore {

    func createDevData() {
        exerciseDays = [ExerciseDay(date: Date().addingTimeInterval(-86400), exercises: [
            Exercise.exercise[0].exerciseName,
            Exercise.exercise[1].exerciseName,
            Exercise.exercise[2].exerciseName,
            Exercise.exercise[3].exerciseName,
            Exercise.exercise[4].exerciseName,
            Exercise.exercise[5].exerciseName
        ])]
    }
}
