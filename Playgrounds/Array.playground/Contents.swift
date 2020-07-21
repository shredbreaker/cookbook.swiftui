import UIKit

func difference(_ list1: [Int], _ list2: [Int]) -> [Int] {
  var list2 = list2
  let diff = list1.difference(from: list2)
  for change in diff {
    switch change {
      case .insert(let offset, let element, _):
        list2.insert(element, at: offset)
      case .remove(let offset, _, _):
        list2.remove(at: offset)
    }
  }
  return list2
}

difference([1, 2, 3, 4, 5], [2, 4, 8, 16, 32]) // [1, 2, 3, 4, 5]
