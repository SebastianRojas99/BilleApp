//
//  DateUtils.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 18/07/2024.
//

import Foundation

extension DateFormatter {
    static let yearMonthDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
