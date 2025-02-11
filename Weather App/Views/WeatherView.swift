//
//  WeatherView.swift
//  Weather App
//
//  Created by Anjaney Pratap Singh on 10/08/24.
//

import SwiftUI

struct WeatherView: View {
    var weather:ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150,alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://t3.ftcdn.net/jpg/02/95/49/62/240_F_295496256_xAAhZGUc9UKbaOSE60vxbTsCkQp4VXvI.jpg")){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer.low", name: "Min Temp", value: (weather.main.temp_min.roundDouble() + "°") )
                        Spacer()
                        
                        WeatherRow(logo: "thermometer.high", name: "Max Temp", value: (weather.main.temp_max.roundDouble() + "°") )
                        
                    }
                    HStack{
                        WeatherRow(logo: "wind", name:"Wind Speed", value: (weather.wind.speed.roundDouble() + "km/hr") )
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%") )
                        
                    }
                }
                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .padding(.bottom, 20)
                                    .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                                    .background(.white)
                                    .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
