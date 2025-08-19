//
//  DateExtension.swift
//  CTWeatherApp
//
//  Created by David Pařízek on 22.07.2025.
//

import Foundation

//Extension pro prácí s datem, využijte dle potřeby (může zůstat prázdné)

extension Date {
    
    static func getDate(stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from:stringDate)!
    }
}
