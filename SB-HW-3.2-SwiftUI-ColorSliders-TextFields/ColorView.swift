//
//  ColorView.swift
//  SB-HW-3.2-SwiftUI-ColorSliders-TextFields
//
//  Created by Sergey Nestroyniy on 03.11.2022.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
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
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 10, green: 20, blue: 30)
    }
}
