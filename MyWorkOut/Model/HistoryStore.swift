//
//  HistoryStore.swift
//  MyWorkOut
//
//  Created by suthichai on 15/9/2564 BE.
//

import Foundation

class HistoryStore : ObservableObject {
    @Published var exerciseDays : [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
        
        load()
    }
    
    func getTodayExerciseData() -> ExerciseDay? {
        let today = exerciseDays.first {
            Date().isSameDay(as: $0.date)
        }
        return today
    }
    
    func getFirstIncompleteExerciseIndex() -> Int? {
        let allExercise = Exercise.exercise.map {
            $0.exerciseName
        }
        let firstExercise = allExercise.first {
            getTodayExerciseData()?.exercises.contains($0) == false
        }!
        return allExercise.firstIndex(of: firstExercise)
    }
    
    func addExercise(exercise : String) {
        let index = exerciseDays.firstIndex {
            Date().isSameDay(as: $0.date)
        }
        if index == nil {
            exerciseDays.append(ExerciseDay(date: Date(), exercises: [exercise]))
        } else {
            if !exerciseDays[index!].exercises.contains(exercise) {
                exerciseDays[index!].exercises.append(exercise)
            }
        }
        save()
    }
    
    func getURL() -> URL? {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent("history.plist")
    }
    
    func save() {
        guard let url = getURL() else {
            print("Cannot get file url")
            return
        }
        
        let plistData = exerciseDays.map {
            [$0.id.uuidString , $0.date , $0.exercises]
        }
        
        do {
            let data = try PropertyListSerialization.data(fromPropertyList: plistData, format: .binary, options: .zero)
            try data.write(to: url, options: .atomic)
        } catch {
             print("Cannot save file")
        }
    }
    
    func load() {
        guard let url = getURL() else {
            print("Cannot get file url")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let plistData = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
            let convertPlistData = plistData as? [[Any]] ?? []
            exerciseDays = convertPlistData.map {
                ExerciseDay(date: $0[1] as? Date ?? Date(), exercises: $0[2] as? [String] ?? [])
            }
        } catch {
            print("Error load file")
        }
    }
    
}

struct ExerciseDay : Identifiable {
    let id = UUID()
    let date : Date
    var exercises  : [String]
}
