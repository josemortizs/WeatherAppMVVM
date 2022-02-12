//
//  ContentView.swift
//  WeatherAppMVVM
//
//  Created by Jose Manuel Ortiz Sanchez on 7/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        Text(weatherViewModel.weatherResponseDataModel?.city ?? "")
            .padding()
            .task {
                //await weatherViewModel.getWeather(city: "Berja")
                await weatherViewModel.getWeatherAsync(city: "Berja")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
