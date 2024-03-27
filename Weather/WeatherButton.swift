//
//  WeatherButton.swift
//  Weather
//
//  Created by Matheus Pinheiro on 26/03/24.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    WeatherButton(
        title: "Change Day Time",
        textColor: .blue,
        backgroundColor: .white
    )
}
