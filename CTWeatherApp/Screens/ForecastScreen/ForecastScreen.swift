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
            
            Button {
                
            } label: {
                Text("Praha")
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button {
                
            } label: {
                Text("New York")
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button {
                
            } label: {
                Text("Aktuální poloha")
            }
            .buttonStyle(PrimaryButtonStyle())

            
            Spacer()
        }
        .padding(.horizontal, 16)
        .task {
            await viewModel.task()
        }
        .loading(viewModel.isLoading)
    }
    
}

#Preview {
    ForecastScreen(viewModel: ForecastViewModel(dataProvider: WeatherDataProvider()))
}
