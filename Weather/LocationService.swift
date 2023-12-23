//
//  LocationService.swift
//  Weather
//
//  Created by Sergey Zakurakin on 10/12/2023.
//

import Foundation

typealias Coordinates = (latitude: Double, longitude: Double)

protocol LocationServiceProtocol {
    
    func currentLocation () async -> Coordinates?
    
    func getLocation(name: String) async -> Coordinates?
    
}

class LocationService: LocationServiceProtocol {
    func currentLocation() async -> Coordinates? {
        return (51.52, -0.11)
    }
    
    func getLocation(name: String) async -> Coordinates? {
        let cityCoordinates: [String: Coordinates] = [
            "London": (51.52, -0.11),
            "Paris": (48.86, 2.34),
            "Berlin": (52.52, 13.40)
        ]
        return cityCoordinates[name]
    }
    
    
}
