//
//  SliderWithTextField.swift
//  DisplayRGB
//
//  Created by Руслан Штыбаев on 30.10.2021.
//

import SwiftUI

struct SliderWithTextField: View {
    @State var sliderValue: Double
    let sliderColor: Color
    @State private var textValue = "0"
    
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .frame(width: 40, height: 8)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(sliderColor)
            
            NumberTextFieldView(value: $textValue, valueForSlider: $sliderValue)
            
        }
        .padding()
        Spacer()
    }
}

struct SliderWithTextField_Previews: PreviewProvider {
    static var previews: some View {
        SliderWithTextField(sliderValue: 50, sliderColor: .red)
    }
}


struct NumberTextFieldView: View {
    @Binding var value: String
    @Binding var valueForSlider: Double
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("", text: $value)
            .bordered()
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        guard let filtred = Double(value) else {
                            return
                        }
                        self.valueForSlider = Double(filtred)
                        self.value = ""
                     isFocused = false
                    }
                }
            }
            .keyboardType(.numberPad)
               .frame(width: 50, height: 8)
    }
    
}

struct BorderedViewModified: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 4)
                        .foregroundColor(.gray))
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(
            content: self,
            modifier: BorderedViewModified()
        )
    }
}
