import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_식을_받았을_때_올바르게_큐에_넣는다() {
        let input = "3 + 1 - 2 / 2 * 2"
        
        let result = ExpressionParser.parse(from: input)
        
        XCTAssertEqual(result.operands.getListItem, [3.0, 1.0, 2.0, 2.0, 2.0])
        XCTAssertEqual(result.operators.getListItem, [Operator.add, Operator.substract, Operator.divide, Operator.multiply])
    }
}
