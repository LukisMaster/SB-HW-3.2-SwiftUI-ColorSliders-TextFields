//
//  ContentView.swift
//  SB-HW-3.2-SwiftUI-ColorSliders-TextFields
//
//  Created by Sergey Nestroyniy on 01.11.2022.
//

import SwiftUI

struct ContentView: View {
        
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
        
    var body: some View {
        ZStack {
            Color(hue: 0.75, saturation: 0.43, brightness: 0.55)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ColorView(red: red, green: green, blue: blue)
                ChannelEditor(value: $red, color: .red)
                ChannelEditor(value: $green, color: .green)
                ChannelEditor(value: $blue, color: .blue)
                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
