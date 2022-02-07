//
//  WeatherResponseDataModel.swift
//  WeatherAppMVVM
//
//  Created by Jose Manuel Ortiz Sanchez on 7/2/22.
//

import Foundation

struct WeatherResponseDataModel: Decodable {
    let city: String
    let weather: [WeatherDataModel]
    let temperature: TemperatureDataModel
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case weather
        case temperature = "main"
    }
}

struct WeatherDataModel: Decodable {
    let main: String
    let description: String
    let iconURLString: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case description
        case iconURLString = "icon"
    }
}

struct TemperatureDataModel: Decodable {
    let currentTemperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case currentTemperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case pressure, humidity
    }
}
