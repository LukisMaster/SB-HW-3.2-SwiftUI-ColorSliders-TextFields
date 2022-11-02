//
//  ContentView.swift
//  SB-HW-3.2-SwiftUI-ColorSliders-TextFields
//
//  Created by Sergey Nestroyniy on 01.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var speed = 50.0
    @State private var isEditing = false
        
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var textRed = ""
    
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var textGreen = ""

    @State private var blue = Double.random(in: 0...255).rounded()
    @State private var textBlue = ""
    
    @State private var alert = false
    
    var body: some View {
        ZStack {
            Color(hue: 0.75, saturation: 0.43, brightness: 0.55)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 150)
                    .foregroundColor(Color(
                        red: red/255,
                        green: green/255,
                        blue: blue/255)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 4)
                    )
                HStack {
                    Text("\(lround(red))")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 40, alignment: .leading)
                    Slider(value: $red, in: 0...255, step: 1)
                        .onAppear {
                            textRed = String(lround(red))
                        }
                        .onChange(of: red) { _ in
                            textRed = String(lround(red))
                        }
                        .tint(.red)
                    TextField("Red", text: $textRed)
                        .onSubmit {
                            if let colorLevel = Int(textRed) {
                                switch colorLevel {
                                case ...(-1):
                                    textRed = "0"
                                    red = 0
                                case 0...255:
                                    red = Double(colorLevel)
                                case 256...:
                                    textRed = "255"
                                    red = 255
                                default:
                                    fatalError()
                                }
                            }
                        }
                        .multilineTextAlignment(.trailing)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
