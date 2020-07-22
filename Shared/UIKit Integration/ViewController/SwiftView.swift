//
//  SwiftView.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 22/7/20.
//

import SwiftUI

struct SwiftView: View {
  var body: some View {
    List {
      ForEach(0..<10) { index in
        NavigationLink(
          destination: TestControllerRepresentation(label: "Index: \(index)"),
          label: {
            Text("Navigate to \(index)")
          }).padding(.bottom)
      }
    }
  }
}

struct SwiftView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SwiftView()
    }
  }
}


