//
//  ViewModel.swift
//  MVVMWeather
//
//  Created by 소프트웨어컴퓨터 on 2021/08/09.
//

import Foundation
//data needed by view

class WeatherViewModel : ObservableObject{
    @Published var timeZone: String = ""
    @Published var daily: [DailyWeather] = []
    
    init(){
        fetchWeather()
    }
    
    func fetchWeather(){
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/onecall?lat=37&lon=126&exclude=hourly,current,alert,minutely&appid=011403b307bff9d59e037082360b03a1")
        else{
            print("Invalid JSON url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("data Invalid")
                return
            }
            
            //convert data to Model
            do{
                let model = try JSONDecoder().decode(WeatherModel.self,from:data)
                DispatchQueue.main.async {
                    /*self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    self.temp = String(format:"%.1f",Double(model.current.temp) * 0.1)
                    self.timezone = model.timezone
                    self.iconURL = "https://openweathermap.org/img/wn/\(model.current.weather.first?.icon ?? "01d")@4x.png"*/
                    self.timeZone = model.timezone
                    print(self.timeZone)
                    /*for (i, dailyWeather) in model.daily.enumerated(){
                        self.daily[i].dt = dailyWeather.dt
                        self.daily[i].temp.day = dailyWeather.temp.day
                        for(index, info) in  dailyWeather.weather.enumerated(){
                            self.daily[i].weather[index].main = info.main
                            self.daily[i].weather[index].description = info.description
                            self.daily[i].weather[index].icon = "https://openweathermap.org/img/wn/\(info.icon)@4x.png"
                        }
                    }*/
                    for (index,dailyWeather) in model.daily.enumerated(){
                        self.daily.append(dailyWeather)
                    }
                    
                }
            }
            catch{
                print("failed")
            }
        }
        task.resume()
    }
}
