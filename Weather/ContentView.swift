//
//  ContentView.swift
//  Weather
//
//  Created by Matheus Pinheiro on 21/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue, Color("lightBlue")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea(.all)
            
            VStack(spacing: 8) {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundStyle(.white)
                    .padding()
                
                VStack {//.bounce.up.byLayer
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("25°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                }
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
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}
