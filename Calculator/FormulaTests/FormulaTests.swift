import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_정상적인_식을_받았을_때_올바른_값을_반환해야한다() {
        let input = "3 + 1 - 2 / 2 * 2"
        
        var result = ExpressionParser.parse(from: input)
        
        XCTAssertEqual(try result.result(), 2)
    }
    
    func test_올바르지않은_식을_받았을_때_에러처리가_되야한다() {
        let input = "3 + 2 + "
        
        var result = ExpressionParser.parse(from: input)
        
        XCTAssertThrowsError(try result.result())
    }
    
    func test_빈_식을_받았을_때_에러처리가_되야한다() {
        let input = ""
        
        var result = ExpressionParser.parse(from: input)
        
        XCTAssertThrowsError(try result.result())
    }
}
