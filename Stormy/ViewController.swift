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
    
    let coordinates: (lat: Double, long: Double) = (37.8267, -122.423)
    
    private let forecastAPIKey = "6104d88ba44f63674aa1f26dfe66f2fa"

    override func viewDidLoad() {
        super.viewDidLoad()

        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinates.lat, long: coordinates.long) {
            (currently) -> Void in
            if let currentWeather = currently {
                // Update UI on main thread
                dispatch_async(dispatch_get_main_queue()) {
                    // Execute closure on the main thread
                    if let temperature = currentWeather.temperature {
                        // Self is always needed in a closure
                        self.currentTemperatureLabel?.text = "\(temperature)°"
                    }
                    if let humidity = currentWeather.humidity {
                        self.currentHumidityLabel?.text = "\(humidity)%"
                    }
                    if let precipitation = currentWeather.precipProbability {
                        self.currentPrecipitationLabel.text = "\(precipitation)%"
                    }
                }
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

