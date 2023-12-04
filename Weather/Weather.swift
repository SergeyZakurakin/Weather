//
//  Weather.swift
//  Weather
//
//  Created by Sergey Zakurakin on 19/11/2023.
//

import Foundation


protocol WeatherProtocol {
    var temperature: Int {get}
    var cityName: String {get}
    var conditions: Conditions {get}
}

struct Weather: WeatherProtocol {
    var temperature: Int
    var cityName: String
    var conditions: Conditions
}


enum Conditions {
    case sun
    case rain
    case snow
}


//protocol showWeatherProtocol{
//    func showWeather()
//}



