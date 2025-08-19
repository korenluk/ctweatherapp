//
//  PrimaryButtonStyle.swift
//  CTWeatherApp
//
//  Created by Lukas Korinek on 19.08.2025.
//

import SwiftUI


struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, minHeight: 48)
            .background(.gray.opacity(0.5))
    }
}
