import Foundation

class IntAsserter {
   /**
    * Asserts if an int is odd or even
    */
   static func odd(_ int: Int) -> Bool {
      if int % 2 == 0 {
       return false
      } else {
       return true
      }
   }
	/**
    * random true or flase
    */
   var eitherOr: Bool { return Bool.random() }//{return arc4random_uniform(2) == 0}
}
