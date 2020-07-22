//
//  ViewControllerRepresentation.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 22/7/20.
//

import Foundation
import UIKit
import SwiftUI

struct TestControllerRepresentation: UIViewControllerRepresentable {
  let label: String

  func makeUIViewController(
    context: UIViewControllerRepresentableContext
    <TestControllerRepresentation>) -> TestViewController {
    let vc = TestViewController()
    vc.text = label
    return vc
  }
  
  func updateUIViewController(_ uiViewController: TestViewController,
                              context: UIViewControllerRepresentableContext
                              <TestControllerRepresentation>) {
    
  }
  
}
