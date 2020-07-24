//
//  ContentView.swift
//  Shared
//
//  Created by Andrei Solovev on 21/7/20.
//

import SwiftUI

struct ContentView: View {
  
  func link<D: View>(_ text: String, to view: D) -> NavigationLink<Text, AnyView> {
    NavigationLink(text, destination: AnyView(view.navigationTitle(text)))
  }
  
  var body: some View {
    List {
      Section(header: Text("UIKit")) {
        link("Navigate to UIViewController", to: TestControllerRepresentation())
        link("UISlider in SwiftUI", to: UISliderExampleView())
      }

      Section(header: Text("Base Components")) {
        link("Text", to: Text("Text"))
        link("TextField", to: Text("TextField"))
      }

      
    }.navigationBarTitle("SwiftUI Cookbook", displayMode: .inline)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}




