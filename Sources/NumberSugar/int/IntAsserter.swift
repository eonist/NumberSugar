import Foundation

public class IntAsserter {
   /**
    * Asserts if an int is odd or even
    * ## Examples:
    * IntAsserter.odd(3) // true
    * IntAsserter.odd(5) // true
    * IntAsserter.odd(6) // false
    */
   public static func odd(_ int: Int) -> Bool {
      if int % 2 == 0 {
         return false
      } else {
         return true
      }
   }
   /**
    * random true or flase
    */
   public var eitherOr: Bool { return Bool.random() }//{return arc4random_uniform(2) == 0}
}
