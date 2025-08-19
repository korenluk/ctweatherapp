//
//  DateVO.swift
//  CTWeatherApp
//
//  Created by Lukas Korinek on 19.08.2025.
//

import Foundation


struct DateVO: Identifiable {
    var id = UUID()
    
    let day: String
    let weekday: String
}

enum DateVoMapper {
    static func map(date: Date) -> DateVO {
        DateVO(day: date.formatted(.dateTime.day()), weekday: date.formatted(.dateTime.weekday()))
    }
}
