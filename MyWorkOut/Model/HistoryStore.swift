//
//  HistoryStore.swift
//  MyWorkOut
//
//  Created by suthichai on 15/9/2564 BE.
//

import Foundation

struct HistoryStore {
    var exerciseDays : [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }

}

struct ExerciseDay : Identifiable {
    let id = UUID()
    let date : Date
    var exercises  : [String]
}
