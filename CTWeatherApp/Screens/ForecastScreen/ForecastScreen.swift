//
//  ForecastScreen.swift
//  CTWeatherApp
//
//  Created by David Pařízek on 22.07.2025.
//

import SwiftUI
import CoreLocation

struct ForecastScreen: View {
    @ObservedObject var viewModel: ForecastViewModel
    
    var body: some View {
        VStack {
            HorizontalCalendarView(dates: viewModel.dates) { index in
                viewModel.onIndexChange(index)
            }
            .frame(height: 70)
            
            Spacer()
            
            HStack(spacing: 8) {
                TemperatureView(viewType: .minTemp, temperature: viewModel.minTemperature)
                
                TemperatureView(viewType: .maxTemp, temperature: viewModel.maxTemperature)
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .task {
            await viewModel.task()
        }
    }
    
}

#Preview {
    ForecastScreen(viewModel: ForecastViewModel(dataProvider: WeatherDataProvider()))
}
