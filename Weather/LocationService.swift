//
//  LocationService.swift
//  Weather
//
//  Created by Sergey Zakurakin on 10/12/2023.
//

import Foundation


protocol LocationServiceProtocol {
    
    func currentLocation () async -> (latitude: Double, longitude: Double)?
    
    func getLocation(name: String) async -> (latitude: Double, longitude: Double)?
    
}

class LocationService: LocationServiceProtocol {
    func currentLocation() async -> (latitude: Double, longitude: Double)? {
        return (51.52, -0.11)
    }
    
    func getLocation(name: String) async -> (latitude: Double, longitude: Double)? {
        let cityCoordinates: [String: (latitude: Double, longitude: Double)] = [
            "London": (51.52, -0.11),
            "Paris": (48.86, 2.34),
            "Berlin": (52.52, 13.40)
        ]
        return cityCoordinates[name]
    }
    
    
}
