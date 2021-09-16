//
//  Exercise.swift
//  MyWorkOut
//
//  Created by suthichai on 13/9/2564 BE.
//

import Foundation

struct Exercise {
    let exerciseName : String
    let videoName : String
    
    enum ExerciseEnum : CustomStringConvertible {
        case Squat
        case Burpee
        case Lunges
        case ObiqueAndCore
        case Planks
        case Pushups
        
        var description : String {
            switch self {
            case .Squat:
                return NSLocalizedString("Squart", comment: "exercise")
            case .Burpee:
                return NSLocalizedString("Burpee", comment: "exercise")
            case .Lunges:
                return NSLocalizedString("Lunges", comment: "exercise")
            case .ObiqueAndCore:
                return NSLocalizedString("ObiqueAndCore", comment: "exercise")
            case .Planks:
                return NSLocalizedString("Planks", comment: "exercise")
            case .Pushups:
                return NSLocalizedString("Pushups", comment: "exercise")
            }
        }
    }
}


extension Exercise {
    static let exercise = [
        Exercise(exerciseName: String(describing: ExerciseEnum.Squat), videoName: "Squat"),
        Exercise(exerciseName: String(describing: ExerciseEnum.Burpee), videoName: "Burpee"),
        Exercise(exerciseName: String(describing: ExerciseEnum.Lunges), videoName: "Lunges"),
        Exercise(exerciseName: String(describing: ExerciseEnum.ObiqueAndCore), videoName: "ObiqueAndCore"),
        Exercise(exerciseName: String(describing: ExerciseEnum.Planks), videoName: "Planks"),
        Exercise(exerciseName: String(describing: ExerciseEnum.Pushups), videoName: "Pushups")
    ]
}
