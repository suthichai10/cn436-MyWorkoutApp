//
//  ProgressView.swift
//  MyWorkOut
//
//  Created by suthichai on 16/9/2564 BE.
//

import SwiftUI

struct TodayProgressView: View {
    @Environment(\.presentationMode) private var presentationMode
    private let history = HistoryStore()
    var body: some View {
        VStack(alignment: .leading) {
            Button("\(Image(systemName: "chevron.left.circle.fill"))") {
                presentationMode.wrappedValue.dismiss()
            }
            .font(.title)
            .padding()
            Form {
                let today = history.exerciseDays.first {
                    Date().isSameDay(as:$0.date)
                }
                ForEach(0..<Exercise.exercise.count) { index in
                    HStack {
                        if ((today?.exercises.contains(Exercise.exercise[index].exerciseName)) != nil) {
                            Text(Exercise.exercise[index].exerciseName)
                            Spacer()
                            Image(systemName : "checkmark").foregroundColor(.green)
                        } else {
                            Text(Exercise.exercise[index].exerciseName)
                            Spacer()
                            Image(systemName : "checkmark").foregroundColor(.red)
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
        ProgressView()
    }
}
