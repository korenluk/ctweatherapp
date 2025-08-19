//
//  WeatherDataProvider.swift
//  CTWeatherApp
//
//  Created by David Pařízek on 22.07.2025.
//

import Foundation


final class WeatherDataProvider {
    private let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&daily=temperature_2m_max&daily=temperature_2m_min")!
    
    private let client = RestApiClient()
    
    func getData() async throws -> WeatherResponse {
        try await client.request(url: url)
    }
}
