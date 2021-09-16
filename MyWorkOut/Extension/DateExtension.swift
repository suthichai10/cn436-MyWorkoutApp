//
//  DateExtension.swift
//  MyWorkOut
//
//  Created by suthichai on 15/9/2564 BE.
//

import SwiftUI

extension Date {
    func formatted(as format:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func isSameDay(as day:Date) -> Bool {
        formatted(as: "d MMM YYYY") == day.formatted(as: "d MMM YYYY")
    }
}
