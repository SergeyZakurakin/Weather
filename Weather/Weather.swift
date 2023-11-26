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
}

struct Weather: WeatherProtocol {
    var temperature: Int
    var cityName: String
}


protocol showWeatherProtocol{
    func showWeather()
}



