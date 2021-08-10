//
//  ContentView.swift
//  MVVMWeather
//
//  Created by 소프트웨어컴퓨터 on 2021/08/09.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    var body:some View{
        NavigationView{
            VStack(spacing:10){
                Text(viewModel.timezone).font(.system(size:32))
                Text(viewModel.temp).font(.system(size: 44))
                Text(viewModel.title).font(.system(size: 24))
                Text(viewModel.descriptionText).font(.system(size: 24))
            }
            .navigationTitle("Weather MVVM")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
