import XCTest
import NumberSugar

class IOSTest: XCTestCase {
   override func setUp() {
      super.setUp()
   }
   override func tearDown() {
      super.tearDown()
   }
   func testExample() {
      IOSTest.numberParser()
      IOSTest.unitParserTest()
      IOSTest.intParserTests()
      IOSTest.cgFloatAssertTests()
      IOSTest.cgFloatExtensionTests()
      IOSTest.cgFloatParserTests()
      IOSTest.cgFloatModifierTests()
   }
   func testPerformanceExample() {
      self.measure { }
   }
}
extension IOSTest {
   /**
    * numberParser
    */
   private static func numberParser() {
      XCTAssertEqual(NumberParser.minMax(100, 200, 400), 200)
      XCTAssertEqual(NumberParser.minMax(500, 200, 400), 400)
      XCTAssertEqual(NumberParser.minMax(300, 200, 400), 300)
      XCTAssertEqual(NumberParser.decimals(4.433), 3)
   }
   /**
    * numberAsserter
    */
   private static func intAsserter() {
      XCTAssertTrue(IntAsserter.odd(3)) // true
      XCTAssertTrue(IntAsserter.odd(5)) // true
      XCTAssertFalse(IntAsserter.odd(6)) // false
   }
   /**
    * numberModifier
    */
   private static func unitParserTest() {
       XCTAssertEqual(UIntParser.normalize(0, 4), 0)
       XCTAssertEqual(UIntParser.normalize(1, 4), 1)
       XCTAssertEqual(UIntParser.normalize(2, 4), 2)
       XCTAssertEqual(UIntParser.normalize(3, 4), 3)
       XCTAssertEqual(UIntParser.normalize(4, 4), 0)
       XCTAssertEqual(UIntParser.normalize(5, 4), 1)
       XCTAssertEqual(UIntParser.normalize(6, 4), 2)
       XCTAssertEqual(UIntParser.normalize(7, 4), 3)
       XCTAssertEqual(UIntParser.normalize(8, 4), 0)
   }
   /**
    * intParserTests
    */
   private static func intParserTests() {
      XCTAssertTrue([0,1,2,3].contains(IntParser.random(0, 3)))
      XCTAssertEqual(IntParser.normalize(3, 7), 3)
      XCTAssertEqual(IntParser.normalize(-3, 7), 4)
      XCTAssertEqual(IntParser.normalize(0, 7), 0)
      XCTAssertEqual(IntParser.normalize(7, 7), 0)
      XCTAssertEqual(IntParser.normalize(8, 7), 1)
      XCTAssertEqual(IntParser.normalize(12, 7), 5)
      XCTAssertEqual(IntParser.minMax([8, -6, 2, 109, 3, 71])?.min, -6) //
      XCTAssertEqual(IntParser.minMax([8, -6, 2, 109, 3, 71])?.max, 109) //
      XCTAssertEqual(IntParser.max([1, 2, 3, 10, 100]), 100)
      XCTAssertEqual(IntParser.digitCount(99), 2) 
      XCTAssertEqual(IntParser.digitCount(9), 1) 
      XCTAssertEqual(IntParser.digitCount(999), 3)
   }
   /**
    * cgFloatAssertTests
    */
   private static func cgFloatAssertTests() {
      XCTAssertFalse(CGFloatAsserter.odd(0)) // false
      XCTAssertFalse(CGFloatAsserter.odd(2)) // false
      XCTAssertTrue(CGFloatAsserter.odd(1)) // true
      XCTAssertTrue(CGFloatAsserter.odd(3)) // true
      XCTAssertFalse(CGFloatAsserter.odd(4)) // false
      // true, result is 10e-15 which is less than 10e-12
      XCTAssertTrue(CGFloatAsserter.isNear(-1.865_046_554_594_429_3, -1.865_046_554_594_427_3, CGFloatAsserter.epsilon))
      XCTAssertTrue(CGFloatAsserter.near(40, 50, 10)) // true
      XCTAssertTrue(CGFloatAsserter.near(-40, -50, 10)) // true
      XCTAssertTrue(CGFloatAsserter.near(-10, 0, 10)) // true
      XCTAssertTrue(CGFloatAsserter.near(10, 0, 10)) // true
      XCTAssertTrue(CGFloatAsserter.near(-60, -50, 10)) // true
   }
   /**
    * cgFloatExtensionTests
    */
   private static func cgFloatExtensionTests() {
      XCTAssertEqual(12 %% 5, 2)
      XCTAssertEqual(4.3 %% 2.1, 0.099_999_999_999_999_64)
      XCTAssertEqual(4 %% 4, 0)
   }
   /**
    * cgFloatParserTests
    */
   private static func cgFloatParserTests() {
      XCTAssertEqual(CGFloatParser.approx(40.126,2), 40.13)
      XCTAssertEqual(CGFloatParser.approx(40.124,2), 40.12)
      XCTAssertEqual(CGFloatParser.difference(3,7), 4)//
      XCTAssertEqual(CGFloatParser.difference(3,-2), -5)//
      XCTAssertEqual(CGFloatParser.difference(-3,-7), -4)//
      XCTAssertEqual(CGFloatParser.difference(-3,7), 10)//
      XCTAssertEqual(CGFloatParser.interpolate(5, 15, 0.5), 10) //
      XCTAssertEqual(CGFloatParser.interpolate(-150.0, -375.0, 0.1), -172.5) //, also works on negative values 👌
      XCTAssertEqual(CGFloatParser.scalar(0,8,4), 0.5) //Output:
      XCTAssertEqual(CGFloatParser.scalar(0, -100, -25), 0.25);//
      XCTAssertEqual(CGFloatParser.scalar(-200, -100, -150), 0.5);//
      XCTAssertEqual(CGFloatParser.scalar(5, 10, 7.5), 0.5);//
      XCTAssertEqual(CGFloatParser.distance(-5,-2), 3);//
      XCTAssertEqual(CGFloatParser.distance(-5,2), 7);//
      XCTAssertEqual(CGFloatParser.distance(5,2), 3);//
      XCTAssertEqual(CGFloatParser.distance(5,-2), 7);//
      XCTAssertEqual(CGFloatParser.loop(20, 0, 10), 0);//
      XCTAssertEqual(CGFloatParser.loop(-2, -5, 10), 8);//
      XCTAssertEqual(CGFloatParser.interpolatedRange(0, 1, 3), [0.0, 0.5, 1.0])//
      XCTAssertEqual(CGFloatParser.average([1, 2, 3, 4, 5]), 3.0)// returns 3.0, which is the arithmetic mean of these five numbers
      XCTAssertEqual(CGFloatParser.average([3, 8.25, 18.75]), 10.0)// returns 10.0, which is the arithmetic mean of these three numbers
   }
   /**
    * cgFloatModifierTests
    */
   private static func cgFloatModifierTests() {
      XCTAssertEqual(CGFloatModifier.toFixed(4.1234, 3), 4.124) //
      XCTAssertEqual(CGFloatModifier.toFixed(-4.0, 3), -4) //
      XCTAssertEqual(CGFloatModifier.roundTo(46, 45), 45); //
      XCTAssertEqual(CGFloatModifier.roundTo(0, 1), 0); // 0
      XCTAssertEqual(CGFloatModifier.roundTo(100, 180), 180); //
      XCTAssertEqual(CGFloatModifier.roundTo(45, 90), 90); //
      XCTAssertEqual(CGFloatModifier.roundTo(0, 45), 0); //
   }
}
  
