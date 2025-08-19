//
//  ForecastViewModel.swift
//  CTWeatherApp
//
//  Created by Lukas Korinek on 19.08.2025.
//

import Foundation


@MainActor
final class ForecastViewModel: ObservableObject {
    @Published var dates: [DateVO] = []
    @Published var selectedIndex = 0
    @Published var isLoading = false
    
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
    
    let dataProvider: WeatherDataProvider
    
    init(dataProvider: WeatherDataProvider) {
        self.dataProvider = dataProvider
    }
    
    func task() async {
        isLoading = true
        
        do {
            let response = try await dataProvider.getData()

            dates = response.daily.time.compactMap({ DateVoMapper.map(date: Date.getDate(stringDate: $0)) })
            minTemperatures = response.daily.temperatureMin
            maxTemperatures = response.daily.temperatureMax
        } catch {
            print(error)
        }
        
        isLoading = false
    }
    
    func onIndexChange(_ index: Int) {
        selectedIndex = index
    }
}
