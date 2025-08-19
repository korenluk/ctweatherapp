//
//  WeatherDataProvider.swift
//  CTWeatherApp
//
//  Created by David Pařízek on 22.07.2025.
//

import Foundation


final class WeatherDataProvider {
    private let baseUrl = URL(string: "https://api.open-meteo.com/v1/forecast?daily=temperature_2m_max&daily=temperature_2m_min")!
    
    private let client = RestApiClient()
    
    func getData(latitude: Double, longitude: Double) async throws -> WeatherResponse {
        let url = baseUrl.appending(
            queryItems: [
                URLQueryItem(name: "latitude", value: latitude.description),
                URLQueryItem(name: "longitude", value: longitude.description),
            ]
        )
        return try await client.request(url: url)
    }
}
