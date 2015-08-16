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
    
    private let forecastAPIKey = "6104d88ba44f63674aa1f26dfe66f2fa"

    override func viewDidLoad() {
        super.viewDidLoad()
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
        
        // Use NSURLSession API to fetch Data - Asynchronously
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
        // NSURLRequest object - Default to HTTP Get
        let request = NSURLRequest(URL: forecastURL!)
        
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            print(data!)
            print("I'm on a background thread")
        }
        
        dataTask.resume()
        print("I'm on the main thread")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

