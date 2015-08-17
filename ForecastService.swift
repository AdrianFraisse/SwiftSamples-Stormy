//
//  ForecastService.swift
//  Stormy
//
//  Created by Adrian Fraisse on 17/08/2015.
//  Copyright © 2015 Adrian Fraisse. All rights reserved.
//

import Foundation

struct ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    
    init(APIKey: String) {
        forecastAPIKey = APIKey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    func getForecast(lat: Double, long: Double, completion: (CurrentWeather? -> Void)) {
        guard let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL)
        else {
            print("Could not construct a valid URL")
            return
        }
        
        let networkOperation = NetworkOperation(url: forecastURL)
        networkOperation.downloadJSONFromURl {
            (let jsonDictionary) in
            // Completion handler passed to the NetworkOperation

            let currentWeather = self.currentWeatherFromJSONDictionary(jsonDictionary)
            // We send back the CurrentWeather Object to the closure - Giving scope to the calling context
            completion(currentWeather)
        }
    }
    
    func currentWeatherFromJSONDictionary(jsonDictonary: [String:AnyObject]?) -> CurrentWeather? {
        guard let currentWeatherDictionary = jsonDictonary?["currently"] as? [String:AnyObject]
        else {
            print("JsonDictionary returned nil from the currently key")
            return nil
        }
        
        return CurrentWeather(weatherDictionary: currentWeatherDictionary)
    }
}
