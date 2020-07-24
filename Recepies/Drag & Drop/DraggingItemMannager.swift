//
//  DraggedObservableObject.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 25/7/20.
//

import SwiftUI

class DraggingItemMannager: ObservableObject {
  @Published var items: [DraggedItem]
  @Published var selected: String? = nil
  @Published var dropFrame: CGRect = .zero
  @Published var dropOver: Bool = false
  
  init() {
    items = [
      DraggedItem(text: "Drag me!"),
      DraggedItem(text: "Drag me too!"),
      DraggedItem(text: "Don't touch me!"),
    ]
  }
  
  func remove(id: UUID) {
    guard let index = items.firstIndex(where: {$0.id == id}) else { return }
    items.remove(at: index)
  }
}
