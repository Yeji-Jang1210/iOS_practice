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
    let daily: [DailyWeather]
}

struct DailyWeather: Codable{
    var dt: Int
    var temp: Temperature
    var weather: [WeatherInfo]
}

struct Temperature: Codable{
    var day : Float
}

struct WeatherInfo: Codable{
    var main:String
    var description: String
    var icon: String
}
