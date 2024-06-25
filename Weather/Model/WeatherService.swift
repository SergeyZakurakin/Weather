//
//  WeatherService.swift
//  Weather
//
//  Created by Sergey Zakurakin on 26/11/2023.
//

import Foundation


protocol WeatherServiceProtocol {
    func correntLocationWeather() async -> Weather?
    func weatherInLocation(location: (latitude: Double, longitude: Double)) async -> Weather?
    
}

class WeatherService: WeatherServiceProtocol {
    
    var cityname = "London"  // Указываем город для получения погоды

    func correntLocationWeather() async -> Weather? {
        let url = URL(string: url)
        // получение данных
        let data = try! await URLSession.shared.data(from: url!)
        // парсинг данных
        let weather = createWeather(data: data.0, response: nil, error: nil)
        return weather
    }
    
    func weatherInLocation(location: (latitude: Double, longitude: Double)) async -> Weather? {
        
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=\(location.latitude)&longitude=\(location.longitude)&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"
        
        let url = URL(string: urlString)
        // получение данных
        let data = try! await URLSession.shared.data(from: url!)
        // парсинг данных
        let weather = createWeather(data: data.0, response: nil, error: nil)
        return weather
    }

    let url = "https://api.open-meteo.com/v1/forecast?latitude=51.52&longitude=-0.11&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"
    
    private func createWeather(data: Data?, response: URLResponse?, error: Error?) -> Weather? {
        if error != nil {
            return nil
        }
        if let data = data {
            do {
                guard let dictionry = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    return nil
                }
                
                guard let current = dictionry["current"] as? [String: Any] else {
                    return nil
                }
                
                if let temperature = current["temperature_2m"] as? NSNumber {
                    let weather = Weather(temperature: Int(truncating: temperature ), cityName: "London", conditions: .sun)
                    return weather
                }
            } catch {
                
                return nil
            }
            
        }
        return nil

    }
}

//if let data = data {
//    let dictionry = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
//    let current = dictionry["current"] as! [String: Any]
//    let temperature = current["temperature_2m"]
//    return Weather(temperature: Int(temperature as! NSNumber), cityName: "London", conditions: .sun)
//}
