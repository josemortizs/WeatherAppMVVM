//
//  WeatherRepository.swift
//  WeatherAppMVVM
//
//  Created by Jose Manuel Ortiz Sanchez on 12/2/22.
//

import Foundation

final class WeatherRepository {
    
//    func getWeather(city: String) async throws -> WeatherResponseDataModel {
//        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=metric&lang=es")!
//        let (data, _) = try await URLSession.shared.data(from: url)
//        return try JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
//    }
    
    func getWeather(city: String) async throws -> (WeatherResponseDataModel?, WeatherError?) {
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=metric&lang=es") {
            
            do {
                async let (data, _) = try await URLSession.shared.data(from: url)
                let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
                
                let str = try! await String(decoding: data, as: UTF8.self)
                print(str)
                
                return (dataModel, nil)
                
            } catch {
                print(error.localizedDescription)
            }
            
        } else {
            return (nil, WeatherError.BAD_URL)
        }
    }
    
}
