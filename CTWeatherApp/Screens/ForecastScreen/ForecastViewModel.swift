//
//  ForecastViewModel.swift
//  CTWeatherApp
//
//  Created by Lukas Korinek on 19.08.2025.
//

import Foundation
import CoreLocation


@MainActor
final class ForecastViewModel: ObservableObject {
    @Published var dates: [DateVO] = []
    @Published var selectedIndex = 0
    @Published var isLoading = false
    @Published var city = ""
    @Published var country = ""
    @Published var errorMessage: String?
    
    var minTemperatures: [Double] = []
    var minTemperature: Double {
        if minTemperatures.isEmpty {
            return 0
        } else {
            return minTemperatures[selectedIndex]
        }
    }
    
    var maxTemperatures: [Double] = []
    var maxTemperature: Double {
        if maxTemperatures.isEmpty {
            return 0
        } else {
            return maxTemperatures[selectedIndex]
        }
    }
    
    private let dataProvider: WeatherDataProvider
    private let locationManager: LocationManager
    
    init(dataProvider: WeatherDataProvider, locationManager: LocationManager) {
        self.dataProvider = dataProvider
        self.locationManager = locationManager
    }
    
    func loadLocation(latitude: Double, longitude: Double) async {
        isLoading = true
        
        do {
            let response = try await dataProvider.getData(latitude: latitude, longitude: longitude)
            dates = response.daily.time.compactMap({ DateVoMapper.map(date: Date.getDate(stringDate: $0)) })
            minTemperatures = response.daily.temperatureMin
            maxTemperatures = response.daily.temperatureMax
            
            let place = try await CLLocation(latitude: latitude, longitude: longitude).geocode()
            city = place?.first?.locality ?? "Unknown city"
            country = place?.first?.country ?? "Unknown country"
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func onIndexChange(_ index: Int) {
        selectedIndex = index
    }
    
    func onCurrentLocationButtonTap() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        Task {
            if let location = locationManager.lastLocation {
                await loadLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            }
        }
    }
}
