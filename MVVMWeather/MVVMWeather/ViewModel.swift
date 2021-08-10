//
//  ViewModel.swift
//  MVVMWeather
//
//  Created by 소프트웨어컴퓨터 on 2021/08/09.
//

import Foundation
//data needed by view

class WeatherViewModel : ObservableObject{
    @Published var title: String = ""
    @Published var descriptionText: String = ""
    @Published var temp: String = ""
    @Published var timezone: String = ""
    @Published var iconURL : String = ""
    
    init(){
        fetchWeather()
    }
    
    func fetchWeather(){
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/onecall?lat=37&lon=126&exclude=hourly,daily,minutely&appid=011403b307bff9d59e037082360b03a1")
        else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //convert data to Model
            do{
                let model = try JSONDecoder().decode(WeatherModel.self,from:data)
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    self.temp = String(format:"%.1f",Double(model.current.temp) * 0.1)
                    self.timezone = model.timezone
                    self.iconURL = "https://openweathermap.org/img/wn/\(model.current.weather.first?.icon ?? "01d").png"
                }
            }
            catch{
                print("failed")
            }
        }
        task.resume()
    }
}
