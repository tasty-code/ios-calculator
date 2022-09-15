import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_6과_3를_더했을_때_9을_반환한다() {
        sut = .add
        
        let result = try? sut.calculate(lhs: 6, rhs: 3)
        
        XCTAssertEqual(result, 9)
    }
    
    func test_6과_3을_뺐을_때_3를_반환한다() {
        sut = .substract
        
        let result = try? sut.calculate(lhs: 6, rhs: 3)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_6과_3을_나눴을_때_2를_반환한다() {
        sut = .divide
        
        let result = try? sut.calculate(lhs: 6, rhs: 3)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_6과_3을_곱했을_때_18을_반환한다() {
        sut = .multiply
        
        let result = try? sut.calculate(lhs: 6, rhs: 3)
        
        XCTAssertEqual(result, 18)
    }

    func test_6을_0으로_나눴을_때_에러처리가_되야한다() {
        sut = .divide
        
        XCTAssertThrowsError(try sut.calculate(lhs: 6, rhs: 0))
    }
}
