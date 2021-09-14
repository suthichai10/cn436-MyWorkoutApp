//
//  RatingView.swift
//  MyWorkOut
//
//  Created by suthichai on 14/9/2564 BE.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack {
            ForEach(0..<5) { _ in
                Image(systemName: "star")
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
            .previewLayout(.sizeThatFits)
    }
}
