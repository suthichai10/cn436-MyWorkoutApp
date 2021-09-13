//
//  WelcomeView.swift
//  MyWorkOut
//
//  Created by suthichai on 13/9/2564 BE.
//

import SwiftUI

struct WelcomeView : View {
    @Binding var selectedTab : Int
    @State private var todayWorkoutCount = 0
    var body : some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("Get fit").font(.largeTitle)
                    Text("with high intensity interval training")
                }
                Spacer()
                VStack(alignment:.center) {
                    Spacer()
                    Text("Welcome").font(.largeTitle).bold()
                    Image("workout")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 240, height: 240)
                    Spacer()
                }
                Spacer()
            }
            VStack(alignment:.center) {
                Button("Get Start") {
                    selectedTab = 0
                }.font(.largeTitle)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                ProgressView("Today Progress :  \(todayWorkoutCount) / \(5)",value: Float(todayWorkoutCount) , total:5)
                    .frame(width: 200, height: 200)
            }
        }
    }
}

struct WelcomeView_Previews : PreviewProvider {
    static var previews : some View {
        WelcomeView(selectedTab: .constant(0))
    }
}

