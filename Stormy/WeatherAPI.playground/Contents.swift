//: Playground - noun: a place where people can play

import Foundation

let forecastAPIKey = "6104d88ba44f63674aa1f26dfe66f2fa"

let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)

// Data object to fetch weather data - Synchronously
// let weatherData = NSData(contentsOfURL: forecastURL!)
//print(weatherData)

