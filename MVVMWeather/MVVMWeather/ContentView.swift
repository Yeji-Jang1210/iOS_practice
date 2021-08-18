//
//  ContentView.swift
//  MVVMWeather
//
//  Created by 소프트웨어컴퓨터 on 2021/08/09.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    var body:some View{
        NavigationView{



            VStack(spacing:10){
                /*KFImage(URL(string:viewModel.iconURL))
                    .resizable()
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.bottom,80)*/
                Text(viewModel.timeZone).font(.system(size:32))
                /*Text(viewModel.temp).font(.system(size: 44))
                Text(viewModel.title).font(.system(size: 24))
                Text(viewModel.descriptionText).font(.system(size: 24))
            */}
            .navigationTitle("Weather MVVM")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
