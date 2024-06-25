//
//  WeatherManager.swift
//  Weather
//
//  Created by Sergey Zakurakin on 31/12/2023.
//

import Foundation



struct LocationManager {
    
    var url = "https://geocode.maps.co/search?&api_key=658eceba168c9076314183bvmfc3f66"
    
    
    func getLocation(cityName: String) {
        let urlString = "\(url)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJson(locationData: safeData)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJson(locationData: Data){
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode(LocationData.self, from: locationData)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            print (decodedData.displayName)
        } catch {
            print(error)
        }
        
    }
    
}

