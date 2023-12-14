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


//class RandomWeatherService: WeatherServiceProtocol {
//    func correntLocationWeather() async -> Weather? {
//        return Weather(temperature: Int.random(in: 0...30), cityName: "London", conditions: .rain)
//    }


//}



class WeatherService: WeatherServiceProtocol {
    
//    let cityCoordinates: [String: (latitude: Double, longitude: Double)] = [
//        "London": (51.52, -0.11),
//        "Paris": (48.86, 2.34),
//        "Berlin": (52.52, 13.40)
 //   ]
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

    
    //    let city = ["London": "latitude=51.52&longitude=-0.11",
    //                "Paris": "latitude=48.86&longitude=2.34",
    //                "Berlin": "latitude=52.52&longitude=13.40"]
    
    //    "https://api.open-meteo.com/v1/forecast?latitude=51.52&longitude=-0.11&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"
    
    
    let url = "https://api.open-meteo.com/v1/forecast?latitude=51.52&longitude=-0.11&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"
    
    func createWeather(data: Data?, response: URLResponse?, error: Error?) -> Weather? {
        if error != nil {
            return nil
        }
        if let data = data {
            let dictionry = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
            let current = dictionry["current"] as! [String: Any]
            let temperature = current["temperature_2m"]
            return Weather(temperature: Int(temperature as! NSNumber), cityName: "London", conditions: .sun)
        }
        
        return nil
    }
    
}
