//
//  ContentView.swift
//  Weather
//
//  Created by Matheus Pinheiro on 21/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack(spacing: 8) {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 25
                )
                    .padding(.bottom, 40)
                
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                 imageName: "cloud.sun.fill",
                                 temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                 imageName: "sun.max.fill",
                                 temperature: 36)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                 imageName: "wind.snow",
                                 temperature: -10)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                 imageName: "sunset.fill",
                                 temperature: 22)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                 imageName: "snow",
                                 temperature: -8)
                }
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut) {
                        isNight.toggle()
                    }
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white
                    )
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundStyle(.white)
            .padding()

    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        
    }
}
