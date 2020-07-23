//
//  ViewController.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 22/7/20.
//

import UIKit

// Any UIViewController that we want to use in SwiftUI
class TestViewController: UIViewController {
  var text: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let label = UILabel(frame: view.bounds)
    label.text = text
    view.addSubview(label)
  }
}
