import XCTest

class NumberSugarTest: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      XCTAssertEqual(NumberParser.minMax(100, 200, 400), 200)
      XCTAssertEqual(NumberParser.minMax(500, 200, 400), 400)
      XCTAssertEqual(NumberParser.minMax(300, 200, 400), 300)
    }
}
