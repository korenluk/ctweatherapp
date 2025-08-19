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
    let temperature: Double
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Text(viewType.title)
                    .font(.system(size: 20))
                    
                
                Text(temperature.description)
                    .font(.system(size: 30).bold())
            }
            .padding()
            
            Spacer()
            
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.blue.opacity(0.5), lineWidth: 2)
        }
    }
}

#Preview {
    TemperatureView(viewType: .maxTemp, temperature: 20.5)
}
