//
//  CityManager.swift
//  Weather
//
//  Created by Sergey Zakurakin on 07/01/2024.
//

import Foundation


struct LocationData: Codable {
    let displayName: String
    let lat: String
    let lon: String
    
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case lat = "lat"
        case lon = "lon"
    }
}


