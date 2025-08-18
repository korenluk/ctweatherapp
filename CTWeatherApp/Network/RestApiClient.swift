//
//  RestApiClient.swift
//  CTWeatherApp
//
//  Created by David Pařízek on 22.07.2025.
//


import Foundation

final class RestApiClient {
    let session = URLSession.shared
    
    func request<T: Codable>(url: URL) async throws -> T {
        let (data, _) = try await session.data(from: url)
        return try decode(data: data)
    }
    
    private func decode<T:Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
