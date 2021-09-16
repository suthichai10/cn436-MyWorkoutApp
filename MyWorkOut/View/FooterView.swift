//
//  FooterVIew.swift
//  MyWorkOut
//
//  Created by suthichai on 14/9/2564 BE.
//

import SwiftUI

struct FooterView: View {
    @Binding var selectedTab : Int
    @Binding var showHistory : Bool
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<Exercise.exercise.count) { index in
                    let fill = (index == selectedTab) ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(fill)")
                        .onTapGesture {
                            selectedTab = index
                        }
                        .font(.largeTitle)
                }
            }
            Button(NSLocalizedString("History", comment: "History")) {
                showHistory = true
            }
            .padding()
        }
    }
}

struct FooterVIew_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(selectedTab: .constant(0), showHistory: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
