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
    
    
    
    let weather = Weather(temperature: 21, cityName: "London")
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func weatherCheckButtom(_ sender: UIButton) {
        let temperature = TemperatureLabel!
        let location = LocationLabel!
        temperature.text = "\(String(weather.temperature)) °C"
        location.text = (String(weather.cityName))
        print(searchTextField.text!)
        
        
    }
    
    
}
