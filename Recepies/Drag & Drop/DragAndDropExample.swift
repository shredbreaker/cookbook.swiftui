//
//  DragAndDropExample.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 25/7/20.
//

import SwiftUI

struct DragAndDropExample: View {
  @EnvironmentObject var manager: DraggingItemMannager
  var body: some View {
    VStack {
      // Drag From area
      HStack(spacing: 10) {
        ForEach(manager.items) { item in
          DraggedView(item: item)
        }
      }
      .frame(minWidth:0, maxWidth: .infinity)
      .frame(width: 180)
      
      // Drag To area
      GeometryReader { geometry in
        VStack {
          HStack(alignment:.center) {
            Spacer()
            Text(manager.selected ?? "{Drag Text Here}")
              .font(.title)
              .fixedSize()
            Spacer()
          }
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
          .overlay(manager.dropOver ? Color.green.opacity(0.2) : Color.gray.opacity(0.2))
        }
        .onAppear {
          // Set frame of the drop area in global coordinates
          manager.dropFrame = geometry.frame(in: .global)
        }
      }
      .padding()
      .zIndex(-1) // Move view to background, so dragged items would appear on top of dragged area

    }
  }
}

struct DragAndDropExample_Previews: PreviewProvider {
  static var previews: some View {
    DragAndDropExample()
      .environmentObject(DraggingItemMannager())
  }
}


