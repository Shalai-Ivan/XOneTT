//
//  APIManager.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import UIKit

class APIManager {
    func loadJson(completionHandler: @escaping (WeatherModel) -> Void) {
        if let url = Bundle.main.url(forResource: "TestTaskJSON", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let weatherModel = try JSONDecoder().decode(WeatherModel.self, from: data)
                completionHandler(weatherModel)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    static func parseImage(code: Int) -> UIImage {
        switch code {
        case 200...232:
            return UIImage(systemName: "cloud.bolt.rain.fill")!
        case 300...321:
            return UIImage(systemName: "cloud.drizzle.fill")!
        case 500...531:
            return UIImage(systemName: "cloud.rain.fill")!
        case 600...622:
            return UIImage(systemName: "snow")!
        case 701...781:
            return UIImage(systemName: "smoke.fill")!
        case 801...804:
            return UIImage(systemName: "cloud.fill")!
        case 800:
            return UIImage(systemName: "sun.min.fill")!
        default:
            return UIImage(systemName: "cloud")!
        }
    }
}
