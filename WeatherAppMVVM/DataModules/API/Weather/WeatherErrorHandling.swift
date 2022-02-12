//
//  WeatherErrorHandling.swift
//  WeatherAppMVVM
//
//  Created by Jose Manuel Ortiz Sanchez on 8/2/22.
//

import Foundation

enum WeatherError: Error {
    case ERROR_DESSERIALIZING
    case BAD_URL
    case OTHER_ERROR
}
