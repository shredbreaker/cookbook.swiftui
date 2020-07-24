//
//  DragGestureExample.swift
//  swiftui-cookbook (iOS)
//
//  Created by Andrey Soloviov on 25/7/20.
//

import SwiftUI

struct DragGestureExample: View {
  @State private var offset: CGSize = .zero
  
  var body: some View {
    VStack(spacing:20) {
      UseOnChanged()
      UseUpdating()
      UseAddToOffset()
    }
    
  }
}

extension DragGestureExample {
  struct UseOnChanged: View {
    @State private var offset: CGSize = .zero
    
    var body: some View {
      Text("Drag me!")
        .offset(offset)
        .animation(.easeOut)
        .gesture(
          DragGesture(minimumDistance: 10.0)
            .onChanged { (value) in
              // Change offset to move view
              self.offset = value.translation
            }
            .onEnded { _ in
              // Reset offset to move view back
              self.offset = CGSize.zero
            }
        )
      
    }
    
  }
}

extension DragGestureExample {
  struct UseUpdating: View {
    // Property needs to be GestureState for using in .updating()
    @GestureState private var offset: CGSize = .zero
    
    var body: some View {
      Text("Drag me too!")
        .offset(offset)
        .animation(.easeOut)
        .gesture(
          DragGesture(minimumDistance: 10.0)
            .updating($offset, body: { (value, state, transition) in
              state = value.translation
            })
        )
      
    }
  }
}

extension DragGestureExample {
  struct UseAddToOffset: View {
    // Property needs to be GestureState for using in .updating()
    @GestureState private var translation: CGSize = .zero
    @State private var offset: CGSize = .zero
    
    var body: some View {
      Text("Drag me out!")
        .offset(addToOffset(translation: translation))
        .animation(.easeOut)
        .gesture(
          DragGesture(minimumDistance: 10.0)
            .updating($translation, body: { (value, state, transition) in
              state = value.translation
            })
            .onEnded { value in
              self.offset = self.addToOffset(translation: value.translation)
            }
        )
      
    }

    func addToOffset(translation: CGSize) -> CGSize {
      return CGSize(width: offset.width + translation.width,
                    height: offset.height + translation.height)
      
    }
  }
}

struct DragGestureExample_Previews: PreviewProvider {
  static var previews: some View {
    DragGestureExample()
  }
}






