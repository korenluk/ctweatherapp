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
        let (data, response) = try await session.data(from: url)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw NetworkingError.invalidStatusCode(statusCode: -1)
        }
        
        guard (200...299).contains(statusCode) else {
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }
        
        return try decode(data: data)
    }
    
    private func decode<T:Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}

enum NetworkingError: Error {
    case invalidStatusCode(statusCode: Int)
}
