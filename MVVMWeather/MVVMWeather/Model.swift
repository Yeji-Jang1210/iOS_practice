//
//  Model.swift
//  MVVMWeather
//
//  Created by 소프트웨어컴퓨터 on 2021/08/09.
//

import Foundation

//data

struct WeatherModel : Codable{
    let timezone: String
    let current: CurrentWeather
}

struct CurrentWeather: Codable{
    let temp: Float
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable{
    let main:String
    let description: String
    let icon: String
}
