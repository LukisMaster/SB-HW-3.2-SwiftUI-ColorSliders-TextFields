//
//  ChannelEditor.swift
//  SB-HW-3.2-SwiftUI-ColorSliders-TextFields
//
//  Created by Sergey Nestroyniy on 03.11.2022.
//

import SwiftUI
// MARK: - ChannelEditor
struct ChannelEditor: View {
    @Binding var value : Double
    
    @State private var textColor = ""

    let color: Color
        
    var body: some View {
        HStack {
            ChannelDisplayText(value: value)
            ChannelSlider(value: $value, textColor: $textColor, color: color)
            ChannelTextField(value: $value, textColor: $textColor)
        }
    }
}

struct ChannelEditor_Previews: PreviewProvider {
    static var previews: some View {
        ChannelEditor(value: .constant(20), color: .red)
    }
}
