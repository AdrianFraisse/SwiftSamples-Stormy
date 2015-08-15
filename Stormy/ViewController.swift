//
//  ViewController.swift
//  Stormy
//
//  Created by Adrian Fraisse on 14/08/2015.
//  Copyright © 2015 Adrian Fraisse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
            weatherDictionary = NSDictionary(contentsOfFile: plistPath),
            currentWeatherDictionary = weatherDictionary["currently"] as? [String:AnyObject] {
                
                let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)

                currentTemperatureLabel?.text = "\(currentWeather.temperature)°"
                currentHumidityLabel?.text = "\(currentWeather.humidity)%"
                currentPrecipitationLabel?.text = "\(currentWeather.precipProbability)%"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

