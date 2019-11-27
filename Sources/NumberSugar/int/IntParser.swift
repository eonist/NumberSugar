import Foundation

public class IntParser {
   /**
    * Return a  Random number within a min max value
    * ## Examples: IntParser.random(0,3)//Can return either of: 0,1,2,3
    @ - Important: You now have the native `let randomInt = Int.random(in: 1..<5)`
    */
   public static func random(_ min: Int, _ max: Int) -> Int {//returns an integer between 0 - x
      return Int.random(in: min..<max)//--Int(arc4random_uniform(UInt32(max)) + UInt32(min))
   }
   /**
    * Returns a normalized integer value (loopy index)
    * - Note: Great for iterating int arrays
    * - Note: Can be used for looping items in an array (carousel etc)
    * ## Examples:
    * print(IntParser.normalize(3, 7))//3
    * print(IntParser.normalize(-3, 7))//4
    * print(IntParser.normalize(0, 7))//0
    * print(IntParser.normalize(7, 7))//0
    * print(IntParser.normalize(8, 7))//1
    * print(IntParser.normalize(12, 7))//5
    * Was: return index >= 0 ? (index < len ? index : index % len) : (len + (index % len))//IMPORTANT: print(IntParser.normalize(-7, 7)) yields 7, which is wrong it should be 0
    */
   public static func normalize(_ index: Int, _ len: Int) -> Int {
      if index >= 0 {
         if index < len {
            return index
         } else {
            return index % len
         }
      } else {
         if index % len == 0 {
            return 0
         } else {
            return len + (index % len)
         }
      }
   }
   /**
    * - Fixme: ⚠️️ ⚠️️ Return enum
    */
   public static func kind(_ theInt: Int) -> String {
      switch theInt {
      case 0:
         return "Zero"
      case let x where x > 0://<--where is a constraint, must be true
         return "Positive"
      default:
         return "Negative"
      }
   }
   /**
    * ## Examples: minMax([8, -6, 2, 109, 3, 71])//(-6,109)
    * ## Examples: minMax([8, -6, 2, 109, 3, 71]).min //-6
    * ## Examples: minMax([8, -6, 2, 109, 3, 71]).max //109
    */
   public static func minMax(_ array: [Int]) -> (min: Int, max: Int)? {
      if array.isEmpty { return nil }
      var currentMin = array[0]
      var currentMax = array[0]
      array[1..<array.count].forEach { value in
         if value < currentMin {
            currentMin = value
         } else if value > currentMax {
            currentMax = value
         }
      }
      return (currentMin, currentMax)
   }
   /**
    * Returns the max int value in PARAM: ints
    * ## Examples: max([1, 2, 3, 10, 100])
    * - Note: Native [1, 5, 2, 9, 4].maxElement() ? might be better?
    */
   public static func max(_ ints: [Int]) -> Int {
      /*var maxInt = ints[0]
       for int in ints {if maxInt < int {maxInt = int}}
       return maxInt*/
      return ints.max() ?? ints[0]
   }
   /**
    * See comment in the forward call (aka use normalize)
    */
   public static func loop(_ index: Int, _ start: Int, _ end: Int) -> Int {// :- Fixme: ⚠️️ start,end,index is easier to understand
      return CGFloatParser.loop(index.cgFloat, start.cgFloat, end.cgFloat).int
   }
   /**
    * Returns the number of digits in a number
    * ## Examples:
    * digitCount(99)//2
    * digitCount(9)//1
    * digitCount(999)//3
    * - - Note: Uses Algebraic math
    * - - Note: Can also be done by converting to a string and counting chars
    */
   public static func digitCount(_ n: Int) -> Int {
      return Int(log2(Double(n)) / log2(10.0)) + 1
   }
}
