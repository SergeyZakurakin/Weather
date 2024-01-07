//
//  ViewController.swift
//  Weather
//
//  Created by Sergey Zakurakin on 19/11/2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var TemperatureLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    

    let location = LocationManager()

    
    
    // обявили переменную, указали что ее тип это протокол
    let weatherService: WeatherServiceProtocol = WeatherService()
    let locationService: LocationServiceProtocol = LocationService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchTextField.delegate = self
        
        
        Task {
            guard let coordinates = await locationService.currentLocation() else { return }
            await updateWeather(coordinates: coordinates)
        }
        
//        Task {
//            do {
//                location = try await NetworkCall.getLocation()
//            } catch NetworkErrors.invalidURL {
//                print("")
//            }
//        }
        
        
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
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let city = textField.text {
            location.getLocation(cityName: city)
        }
        LocationLabel.text = textField.text
        textField.text = ""
        return true
    }
    

    
    
    
    
    
    
}





// 1. как сделать тест (проверить хотябы с консоли)?
// 2. не могу передать данные в textfield
// 3. URLComponents разобрался для чего, не написал так как хотел сначала сделать преведущее
// 4. можно ли написать универсальный метод для получения URL и только подставлять в него URL (не совсем понял)


