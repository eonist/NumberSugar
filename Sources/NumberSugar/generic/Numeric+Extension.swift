import Foundation

extension Sequence {
   /**
    * key path-based API for summing numbers (Int, CGFloat, Double etc)
    * - Fixme: ⚠️️  write doc
    */
   func sum<T: Numeric>(for keyPath: KeyPath<Element, T>) -> T {
      reduce(0) { sum, element in
         sum + element[keyPath: keyPath]
      }
   }
}
