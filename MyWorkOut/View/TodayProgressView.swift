//
//  ProgressView.swift
//  MyWorkOut
//
//  Created by suthichai on 16/9/2564 BE.
//

import SwiftUI

struct TodayProgressView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var history : HistoryStore
    var body: some View {
        VStack(alignment: .leading) {
            Button("\(Image(systemName: "chevron.left.circle.fill"))") {
                presentationMode.wrappedValue.dismiss()
            }
            .font(.title)
            .padding()
            Form {
                let today = history.getTodayExerciseData()
                ForEach(0..<Exercise.exercise.count) { index in
                    HStack {
                        Text(Exercise.exercise[index].exerciseName)
                        Spacer()
                        if today?.exercises != nil , today!.exercises.contains(Exercise.exercise[index].exerciseName) {
                            Image(systemName: "checkmark").foregroundColor(.green)
                        } else {
                            Image(systemName: "checkmark").foregroundColor(.red)
                        }
                    }
                    .padding()
                    .font(.system(size: 20 , design:.rounded))
                }
            }
        }
    }
}

struct TodayProgressView_Previews: PreviewProvider {
    static var previews: some View {
        TodayProgressView()
            .environmentObject(HistoryStore())
    }
}
