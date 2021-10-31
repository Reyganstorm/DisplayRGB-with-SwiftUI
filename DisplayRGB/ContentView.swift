//
//  ContentView.swift
//  DisplayRGB
//
//  Created by Руслан Штыбаев on 30.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSladerValue = Double.random(in: 0...250)
    @State private var greenSladerValue = Double.random(in: 0...250)
    @State private var blueSladerValue = Double.random(in: 0...250)
    
    var body: some View {
        
        ZStack {
            Color(red: 150/255, green: 200/255, blue: 200/255)
                .ignoresSafeArea()
            VStack {
                Color(
                    red: redSladerValue/255,
                    green: greenSladerValue/255,
                    blue: blueSladerValue/255
                    )
                    .frame(width: 250, height: 175)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 6)
                            .foregroundColor(.black)
                    )
                    .padding()
                
                SliderWithTextField(sliderValue: $redSladerValue, sliderColor: .red)
                SliderWithTextField(sliderValue: $greenSladerValue, sliderColor: .green)
                SliderWithTextField(sliderValue: $blueSladerValue, sliderColor: .blue)
                Spacer()
            }
            .padding(.top)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

