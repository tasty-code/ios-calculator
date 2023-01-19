//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Jason on 2023/01/19.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_Operator의_덧셈메서드를통해_결과값으로_더한값을_반환하는지() {
        // given
        let inputLhs = 1.0
        let inputRhs = 2.0
        
        
        // when
        let expectation = 3.0
        
        // then
        let result = Operator.add.calculate(lhs: inputLhs, rhs: inputRhs)
        XCTAssertEqual(expectation, result)
    }
    
    func test_Operator의_뺄셈메서드를통해_결과값으로_뺀값을_반환하는지() {
        // given
        let inputLhs = 1.0
        let inputRhs = 2.0
        
        
        // when
        let expectation = -1.0
        
        // then
        let result = Operator.subtract.calculate(lhs: inputLhs, rhs: inputRhs)
        XCTAssertEqual(expectation, result)
    }
}
