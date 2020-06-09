import CoreGraphics

var NaN: CGFloat = .nan/*Global variable for the sake of convenience*/

extension CGFloat {
   public func toFixed(_ places: Int) -> CGFloat { CGFloatModifier.toFixed(self, places) }
   public func isNear(_ value: CGFloat, _ epsilon: CGFloat = 10e-12) -> Bool { CGFloatAsserter.isNear(self, value, epsilon) }
   public var uint: UInt { UInt(self) }
   public var int: Int { Int(self) }
   public var float: Float { Float(self) }
   public var string: String { String(describing: self) }
   public var str: String { String(describing: self) }/*shorthand*/
   public var isNegative: Bool { NumberAsserter.negative(self, 0) }
   public var isPositive: Bool { NumberAsserter.positive(self, 0) }
   public var positive: CGFloat { abs(self) }//new
   public var negative: CGFloat { -abs(self) }//new
   public func clip(_ min: CGFloat, _ max: CGFloat) -> CGFloat { NumberParser.clip(self, min, max) }/*Convenince*/
   public func interpolate(_ to: CGFloat, _ scalar: CGFloat) -> CGFloat { CGFloatParser.interpolate(self, to, scalar) }
   public func roundTo(_ closest: CGFloat) -> CGFloat { CGFloatModifier.roundTo(self, closest) }/*Convenince*/
   /**
    * CGFloat(10).min(5)//5
    * CGFloat(10).min(15)//10
    */
   public func min(_ min: CGFloat) -> CGFloat {
      Swift.min(self, min)
   }
   public func max(_ max: CGFloat) -> CGFloat {
      Swift.max(self, max)
   }
}
extension Sequence where Iterator.Element == CGFloat {
   public var average: CGFloat { CGFloatParser.average(self as! [CGFloat]) }
}
/*extension Array where Element == CGFloat{
 
 }*/
/**
 * Swift 3 removed the possibility to cast CGFloat to Bool This method brings back this functionality.
 * JUSTIFICATION: Most other languages allow this functionality, and is familiar to the user the alternative is verbose code. Which makes code cognitively harder to read.
 * - Note: Bool(Int(1)) still works natively
 * ## Examples: (expected results from other languages)
 * Bool(CGFloat(0))//false
 * Bool(CGFloat(-2))//true
 * Bool(CGFloat(20))//true
 * Bool(CGFloat.nan)//true
 */
extension Bool {
   public init(_ value: CGFloat) {
      self.init(value != 0)
   }
}
/**
 * Support for addition of CGFLoat and Double
 * - Fixme: ⚠️️ probably use T or Generics or similar
 * - Fixme: ⚠️️ add support for returning Double aswell
 * - Fixme: ⚠️️ add support for Int and Float aswell
 */
extension CGFloat {
   public static func + (left: CGFloat, right: Double) -> CGFloat {
      left + CGFloat(right)
   }
   /**
    * Support for addition of CGFLoat and Double
    */
   public static func + (left: Double, right: CGFloat) -> CGFloat {
      CGFloat(left) + right
   }
   public static func * (left: Int, right: CGFloat) -> CGFloat {
      CGFloat(left) * right
   }
   public static func * (left: CGFloat, right: Int) -> CGFloat {
      left * CGFloat(right)
   }
   /**
    * Brings back simple modulo syntax (was removed in swift 3)
    * Calculates the remainder of expression1 divided by expression2
    * The sign of the modulo result matches the sign of the dividend (the first number). For example, -4 % 3 and -4 % -3 both evaluate to -1
    * ## Examples:
    * print(12 %% 5)    // 2
    * print(4.3 %% 2.1) // 0.0999999999999996
    * print(4 %% 4)     // 0
    * - Note: The first print returns 2, rather than 12/5 or 2.4, because the modulo (%) operator returns only the remainder. The second trace returns 0.0999999999999996 instead of the expected 0.1 because of the limitations of floating-point accuracy in binary computing.
    * - Note: Int's and UInt can still use single %
    * - Note: there is also .remainder which supports returning negatives as oppose to truncatingRemainder (aka the old %) which returns only positive. .remiander also behaves diferently with negative values. Sometimes more usefully so
    */
   public static func %% (left: CGFloat, right: CGFloat) -> CGFloat {
      left.truncatingRemainder(dividingBy: right)
   }
}
infix operator %%/*<--infix operator is required for custom infix char combos*/
