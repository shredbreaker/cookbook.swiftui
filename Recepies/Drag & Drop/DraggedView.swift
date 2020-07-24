//
//  DraggedView.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 25/7/20.
//

import SwiftUI

struct DraggedView: View {
  @EnvironmentObject var manager: DraggingItemMannager
  @State private var offset: CGSize = .zero
  var item: DraggedItem
  
  var body: some View {
    VStack {
      Text(item.text)
        .font(.body)
        .fixedSize()
        .padding(8)
        .background(Color.pink.opacity(0.2))
        .cornerRadius(8)
    }
    .offset(offset)
    .gesture(DragGesture(minimumDistance: 10)
              .onChanged { value in
                manager.dropOver = manager.dropFrame.contains(value.location)
                offset = value.translation
              }
              .onEnded { value in
                if manager.dropOver {
                  manager.selected = item.text
                  manager.remove(id: item.id)
                } else {
                  offset = .zero
                }
              }
    )
  }
}

struct DraggedView_Previews: PreviewProvider {
  static var previews: some View {
    DraggedView(item: DraggedItem(text: "Test"))
  }
}

