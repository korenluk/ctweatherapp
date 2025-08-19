//
//  Optional.swift
//  CTWeatherApp
//
//  Created by Lukas Korinek on 19.08.2025.
//

import SwiftUI


extension Optional {
    
    func binding() -> Binding<Bool> {
        Binding {
            self != nil
        } set: { _ in
            
        }
    }
}
