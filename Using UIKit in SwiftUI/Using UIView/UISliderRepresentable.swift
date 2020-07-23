//
//  UIViewRepresentable.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 23/7/20.
//

import Foundation
import SwiftUI
import UIKit

struct UISliderRepresentable: UIViewRepresentable {
  // Values that we want to bind between UIKit and SwiftUI
  @Binding var value: Double

  // Create UIKit view
  func makeUIView(context: Context) -> UISlider {
    let slider = UISlider(frame: .zero)
    slider.addTarget(context.coordinator,
                     action: #selector(Coordinator.valueChanged(_:)),
                     for: .valueChanged)
    slider.value = Float(value)
    return slider
  }
  
  // Update UIKit view
  func updateUIView(_ uiView: UISlider, context: Context) {
    uiView.value = Float(value)
  }
  
  // Create coordinator to bind values between UIKit and SwiftUI
  func makeCoordinator() -> Coordinator {
    Coordinator(value: $value)
  }

  // Make subclass of NSObject to receive callbacks from UIKit
  class Coordinator: NSObject {
    var value: Binding<Double>
    init(value: Binding<Double>) {
      self.value = value
    }
    
    // Callback for UISlider
    @objc func valueChanged(_ sender: UISlider) {
      value.wrappedValue = Double(sender.value)
    }
  }
}
