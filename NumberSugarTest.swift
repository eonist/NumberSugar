import XCTest

class NumberSugarTest: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      XCTAssertEqual(NumberParser.minMax(100, 200, 400), 200)
      XCTAssertEqual(NumberParser.minMax(500, 200, 400), 400)
      XCTAssertEqual(NumberParser.minMax(300, 200, 400), 300)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
