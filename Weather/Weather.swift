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






// test !!!!!!

//let cityCoordinates: [String: (latitude: Double, longitude: Double)] = [
//        "London": (51.52, -0.11),
//        "Paris": (48.86, 2.34),
//        "Berlin": (52.52, 13.40)
//    ]


//
//let city = WeatherCity()
//city.berlin

//protocol showWeatherProtocol{
//    func showWeather()
//}



