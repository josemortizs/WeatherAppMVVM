//
//  WeatherViewModel.swift
//  WeatherAppMVVM
//
//  Created by Jose Manuel Ortiz Sanchez on 8/2/22.
//
// API_KEY is a constants with your apikey string from https://openweathermap.org/

import Foundation

final class WeatherViewModel: ObservableObject {
    
    @Published var weatherResponseDataModel: WeatherResponseDataModel?
    
    func getWeather(city: String) async {
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=metric&lang=es") {
            do {
                async let (data, _) = try await URLSession.shared.data(from: url)
                let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.weatherResponseDataModel = dataModel
                }
                
                let str = try! await String(decoding: data, as: UTF8.self)
                print(str)
                
                return
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
