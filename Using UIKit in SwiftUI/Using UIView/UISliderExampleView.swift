//
//  SliderComponent.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 23/7/20.
//

import SwiftUI

struct UISliderExampleView: View {
  @State var value: Double = 0.5
  @State var text: String = ""

  let formatter: NumberFormatter = {
    let numFormatter = NumberFormatter()
    numFormatter.numberStyle = .decimal
    numFormatter.allowsFloats = true
    numFormatter.maximumFractionDigits = 2
    return numFormatter
  }()
  
  var body: some View {
    VStack {
      UISliderRepresentable(value: $value)
      HStack {
        Spacer()
        Text("Value:")
        TextField("Slider Value", value:$value, formatter: formatter)
          .keyboardType(.decimalPad)
          .frame(width: 40.0)
        Spacer()
      }
    }
  }
}

struct SliderComponent_Preview: PreviewProvider {
  static var previews: some View {
    UISliderExampleView()
  }
}

