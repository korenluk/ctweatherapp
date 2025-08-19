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
        VStack(spacing: 32) {
            HorizontalCalendarView(dates: viewModel.dates) { index in
                viewModel.onIndexChange(index)
            }
            .frame(height: 70)
            
            VStack {
                Text(viewModel.city)
                    .font(.headline)
                
                Text(viewModel.country)
                    .font(.subheadline)
            }
            
            HStack(spacing: 8) {
                TemperatureView(viewType: .minTemp, temperature: viewModel.minTemperature)
                
                TemperatureView(viewType: .maxTemp, temperature: viewModel.maxTemperature)
            }
            .padding(.horizontal, 16)
            
            VStack {
                Button {
                    Task {
                        await viewModel.loadLocation(latitude: 50.087, longitude: 14.421)
                    }
                } label: {
                    Text("Praha")
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button {
                    Task {
                        await viewModel.loadLocation(latitude: 40.73, longitude: -73.93)
                    }
                } label: {
                    Text("New York")
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button {
                    viewModel.onCurrentLocationButtonTap()
                } label: {
                    Text("Aktuální poloha")
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding(.horizontal, 16)
            
            Spacer()
        }
        .task {
            await viewModel.loadLocation(latitude: 50.087, longitude: 14.421)
        }
        .loading(viewModel.isLoading)
    }
    
}

#Preview {
    ForecastScreen(viewModel: ForecastViewModel(dataProvider: WeatherDataProvider(), locationManager: LocationManager()))
}
