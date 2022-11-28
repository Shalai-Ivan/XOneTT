//
//  WeatherModel.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import Foundation

struct WeatherModel: Codable {
    let city: String
    let tmpr: String
    let description: String
    let weatherPerDay: [WeatherPerDay]
    let forecast: [Forecast]
    
    enum CodingKeys: String, CodingKey {
        case city, description, forecast
        case tmpr = "temperature"
        case weatherPerDay = "weather_per_day"
    }
}

struct WeatherPerDay: Codable {
    let timestamp: String
    let weatherType: Int
    let tmpr: String
    let sunset: Bool?
    
    enum CodingKeys: String, CodingKey {
        case timestamp, sunset
        case weatherType = "weather_type"
        case tmpr = "temperature"
    }
}

struct Forecast: Codable {
    let date: String
    let minTmpr: Int
    let maxTmpr: Int
    let weatherType: Int
    
    enum CodingKeys: String, CodingKey {
        case date
        case minTmpr = "min_temperature"
        case maxTmpr = "max_temperature"
        case weatherType = "weather_type"
    }
}
