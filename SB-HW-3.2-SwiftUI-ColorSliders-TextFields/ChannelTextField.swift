//
//  ChannelTextField.swift
//  SB-HW-3.2-SwiftUI-ColorSliders-TextFields
//
//  Created by Sergey Nestroyniy on 03.11.2022.
//

import SwiftUI

// MARK: - ChannelTextField
struct ChannelTextField: View {
    
   @Binding var value: Double
   @Binding var textColor : String
   
   @State private var alertIsPresented = false
    
    
   
   var body: some View {
       TextField("", text: $textColor)
           .multilineTextAlignment(.trailing)
           .frame(width: 60, alignment: .center)
           .textFieldStyle(RoundedBorderTextFieldStyle())
           .onSubmit(validate)
           .alert("Неверный формат данных", isPresented: $alertIsPresented) {

           } message: {
               Text("Введите целое число от 0 до 255")
           }
   }
}

// MARK: Private Func

extension ChannelTextField {
    
   private func validate() {
       if let colorLevel = Int(textColor) {
           switch colorLevel {
           case ...(-1):
               textColor = "0"
               value = 0
               alertIsPresented.toggle()
           case 0...255:
               value = Double(colorLevel)
           case 256...:
               textColor = "255"
               value = 255
               alertIsPresented.toggle()
           default:
               fatalError()
           }
       } else {
           textColor = String(lround(value))
           alertIsPresented.toggle()
       }
   }
}


struct ChannelTextField_Previews: PreviewProvider {
    static var previews: some View {
        ChannelTextField(value: .constant(123), textColor: .constant("123"))
    }
}
