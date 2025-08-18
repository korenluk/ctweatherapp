//
//  TemperatureView.swift
//  CTWeatherApp
//
//  Created by David Pařízek on 22.07.2025.
//

import SwiftUI

struct TemperatureView: View {
    
    enum ViewType {
        case minTemp
        case maxTemp
        
        var title: String {
            switch self {
            case .minTemp:
                return "Min"
                
            case .maxTemp:
                return "Max"
            }
        }
    }
    
    let viewType: ViewType
    
    var body: some View {
        Text("View pro zobrazení min/max teploty")
    }
    
}
