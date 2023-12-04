//
//  WeatherService.swift
//  Weather
//
//  Created by Sergey Zakurakin on 26/11/2023.
//

import Foundation


protocol WeatherServiceProtocol {
    func correntLocationWeather() async -> Weather?
    
}


//class RandomWeatherService: WeatherServiceProtocol {
//    func correntLocationWeather() async -> Weather? {
//        return Weather(temperature: Int.random(in: 0...30), cityName: "London", conditions: .rain)
//    }
    
    
//}

class WeatherService: WeatherServiceProtocol {
    
    
    
    func correntLocationWeather() async -> Weather? {
        let url = URL(string: url)
        // получение данных
        let data = try! await URLSession.shared.data(from: url!)
        // парсинг данных
        let weather = createWeather(from: data.0, response: nil, error: nil)
        return weather
    }
    
    
    
    let url = "https://api.open-meteo.com/v1/forecast?latitude=51.52&longitude=-0.11&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"
    
    func createWeather(from: Data?, response: URLResponse?, error: Error?) -> Weather? {
        if error != nil{
            return nil
        }
        if let from = from{
            let dictionry = try! JSONSerialization.jsonObject(with: from) as! [String: Any]
            let current = dictionry["current"] as! [String: Any]
            let temperature = current["temperature_2m"]
            return Weather(temperature: Int(temperature as! NSNumber), cityName: "London", conditions: .sun)
        }
        
        return nil
    }
    
}
