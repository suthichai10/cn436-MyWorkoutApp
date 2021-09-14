//
//  WelcomeView.swift
//  MyWorkOut
//
//  Created by suthichai on 13/9/2564 BE.
//

import SwiftUI

struct WelcomeView : View {
    @Binding var selectedTab : Int
    var body : some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Text(NSLocalizedString("Get fit", comment: "Title")).font(.largeTitle)
                        Text(NSLocalizedString("with high intensity interval training", comment: "Content"))
                    }
                    Spacer()
                    VStack(alignment:.center) {
                        Spacer()
                        Text(NSLocalizedString("Welcome", comment: "Welcome Text")).font(.largeTitle).bold()
                        Image("workout")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.3)
                        Spacer()
                    }
                    Spacer()
                }
                VStack(alignment:.center) {
                    Button(NSLocalizedString("Get Start", comment: "Go Workout")) {
                        selectedTab = 0
                    }.font(.largeTitle)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    ProgressView(NSLocalizedString("Today Progress :  \(0) / \(Exercise.exercise.count)", comment: "Exercise Progress"),value: Float(0) , total:5)
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.3)
                }
            }
        }
    }
}

struct WelcomeView_Previews : PreviewProvider {
    static var previews : some View {
        WelcomeView(selectedTab: .constant(0))
    }
}
