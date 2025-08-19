//
//  CLLocation.swift
//  CTWeatherApp
//
//  Created by Lukas Korinek on 19.08.2025.
//

import CoreLocation


extension CLLocation {
    
    func geocode() async throws -> [CLPlacemark]? {
        return try await withCheckedThrowingContinuation { continuation in
            CLGeocoder().reverseGeocodeLocation(self) { place, error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: place)
                }
            }
        }
    }
}
