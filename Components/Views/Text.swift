//
//  Text.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 24/7/20.
//

import SwiftUI

struct TextExample: View {
  var price: Float = 136.633432

  var body: some View {
    VStack() {
      Text("Simple Text")
      Text("localized_text",
           comment: "This string is automatically localized using Localizable.strings")
      Text("Using formatter with Foundation objects: \(NSNumber(value:price), formatter: priceFormatter)")
      Text("Using specifier: \(price, specifier: "%0.2f")")

    }
  }
}

extension TextExample {
  var priceFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "thb"
    return formatter
  }
}

struct Text_Previews: PreviewProvider {
  static var previews: some View {
    TextExample()
  }
}




