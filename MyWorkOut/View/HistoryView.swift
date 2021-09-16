//
//  HistoryView.swift
//  MyWorkOut
//
//  Created by suthichai on 15/9/2564 BE.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.presentationMode) var presentationMode
    private let history = HistoryStore()
    var body: some View {
        VStack(alignment:.leading) {
            Button("\(Image(systemName: "chevron.left.circle.fill"))") {
                presentationMode.wrappedValue.dismiss()
            }
            .font(.title)
            .padding()
            Text("").background(Color.blue)
            Form {
                ForEach(history.exerciseDays) { day in
                    Section(header: Text(day.date.formatted(as: "d MMM  YYYY"))) {
                        ForEach(0..<day.exercises.count) { index in
                            Text(day.exercises[index])
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
