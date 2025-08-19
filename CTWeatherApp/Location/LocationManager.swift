//
//  LocationManager.swift
//  CTWeatherApp
//
//  Created by Lukas Korinek on 19.08.2025.
//

import CoreLocation
import Foundation


class LocationManager: CLLocationManager, ObservableObject, CLLocationManagerDelegate {

    // MARK: - Property
    
    @Published var lastLocation: CLLocation?

    
    // MARK: - Init
    
    override init() {
        super.init()
        self.delegate = self
        self.desiredAccuracy = kCLLocationAccuracyBest
        self.distanceFilter = 500
    }
    
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {        
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            self.startUpdatingLocation()
        } else {
            self.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        lastLocation = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
             print("error:: \(error.localizedDescription)")
        }
}
