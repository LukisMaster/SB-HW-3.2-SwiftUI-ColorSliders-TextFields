//
//  ChannelSlider.swift
//  SB-HW-3.2-SwiftUI-ColorSliders-TextFields
//
//  Created by Sergey Nestroyniy on 03.11.2022.
//

import SwiftUI

struct ChannelSlider: View {
    @Binding var value: Double
    @Binding var textColor: String
    
    let color: Color
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
            .onAppear {
                textColor = String(lround(value))
            }
            .onChange(of: value) { _ in
                textColor = String(lround(value))
            }
            .tint(color)
    }
}


struct ChannelSlider_Previews: PreviewProvider {
    static var previews: some View {
        ChannelSlider(value: .constant(30), textColor: .constant("123"), color: .red)
    }
}
