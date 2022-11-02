//
//  DisplayText.swift
//  SB-HW-3.2-SwiftUI-ColorSliders-TextFields
//
//  Created by Sergey Nestroyniy on 03.11.2022.
//

import SwiftUI

struct ChannelDisplayText: View {
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .font(.system(size: 20))
            .foregroundColor(.white)
            .frame(width: 40, alignment: .leading)
    }
}

struct DisplayText_Previews: PreviewProvider {
    static var previews: some View {
        ChannelDisplayText(value: 45)
    }
}
