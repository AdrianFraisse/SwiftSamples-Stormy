//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Adrian Fraisse on 14/08/2015.
//  Copyright © 2015 Adrian Fraisse. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    let temperature: Int
    let humidity: Int
    let precipProbability: Int
    let summary: String
    
    init(weatherDictionary: [String:AnyObject]) {
        temperature = weatherDictionary["temperature"] as! Int
        
        let humidityFloat = weatherDictionary["humidity"] as! Double
        humidity = Int(humidityFloat * 100)
        
        let precipProbabilityFloat = weatherDictionary["precipProbability"] as! Double
        precipProbability = Int(precipProbabilityFloat * 100)
        
        summary = weatherDictionary["summary"] as! String
        
    }
}