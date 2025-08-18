//
//  WeatherResponse.swift
//  CTWeatherApp
//
//  Created by David Pařízek on 22.07.2025.
//

import Foundation

struct WeatherResponse: Codable {
    let latitude: Double
    let longitude: Double
    let daily: DailyWeather
}

struct DailyWeather: Codable {
    let time: [String]
    let temperatureMax: [Double]
    let temperatureMin: [Double]
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperatureMax = "temperature_2m_max"
        case temperatureMin = "temperature_2m_min"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.time = try container.decode([String].self, forKey: .time)
        self.temperatureMax = try container.decode([Double].self, forKey: .temperatureMax)
        self.temperatureMin = try container.decode([Double].self, forKey: .temperatureMin)
    }
}
