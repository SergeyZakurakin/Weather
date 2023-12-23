//
//  ViewController.swift
//  Weather
//
//  Created by Sergey Zakurakin on 19/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TemperatureLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    // обявили переменную, указали что ее тип это протокол
    let weatherService: WeatherServiceProtocol = WeatherService()
    let locationService: LocationServiceProtocol = LocationService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            guard let coordinates = await locationService.currentLocation() else { return }
            await updateWeather(coordinates: coordinates)
        }
        
        
    }
    
    @IBAction func weatherCheckButtom(_ sender: UIButton) {
        Task{
            guard let city = searchTextField.text else { return }
            
            // полученый результат гарантировано не нил
            guard let coordinades = await locationService.getLocation(name: city) else {
                return
            }
            await updateWeather(coordinates: coordinades)
            
        }
    }
    
    func updateWeather(coordinates: Coordinates) async {
        guard let weather = await weatherService.weatherInLocation(location: coordinates) else {return}
        let temperature = TemperatureLabel!
        let location = LocationLabel!
        temperature.text = "\(String(weather.temperature)) °C"
        location.text = (String(weather.cityName))
        print(searchTextField.text!)
    }
    
    
}


// поменять город (настроить город)
// через словарь




// сделать чтоб менялось название города

// на старте чтоб приложение запрашивало текущую локацию, запрашивало на старте и искало текущую


// заменить восклицательные знаки




// заменить кортеж на Coordinates - Alias
// переименовать getLocation - getCoordinates


