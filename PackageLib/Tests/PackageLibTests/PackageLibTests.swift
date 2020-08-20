import XCTest
@testable import PackageLib

final class PackageLibTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PackageLib().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
