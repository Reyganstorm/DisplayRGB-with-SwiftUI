//
//  ContentView.swift
//  DisplayRGB
//
//  Created by Руслан Штыбаев on 30.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var redSladerValue = Double.random(in: 0...250)
    @State private var greenSladerValue = Double.random(in: 0...250)
    @State private var blueSladerValue = Double.random(in: 0...250)
    
    var body: some View {
        
        VStack {
            Color(UIColor(red: redSladerValue/255,
                  green: greenSladerValue/255,
                          blue: blueSladerValue/255, alpha: 1))
                .frame(width: 250, height: 175)
            SliderWithTextField(sliderValue: redSladerValue, sliderColor: .red)
            SliderWithTextField(sliderValue: greenSladerValue, sliderColor: .green)
            SliderWithTextField(sliderValue: blueSladerValue, sliderColor: .blue)
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

