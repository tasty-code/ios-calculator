//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 김용재 on 2023/01/20.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let inputString = "1 + 2 ÷ 3 – -4 × -5 + 0"
        sut = ExpressionParser.parse(from: inputString)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_특정_string을_받았을때_Formula객체가_제대로_생성되는지_확인() {
        // given
        let expectedOperands = [1.0, 2.0, 3.0, -4.0, -5.0, 0.0]
        let expectedOperators = [Operator.add, Operator.divide, Operator.substract, Operator.multiply, Operator.add]
        
        // when
        let calculatorItemQueueOperands = sut.operands.enqueueElements
        let calculatorItemQueueOperators = sut.operators.enqueueElements
        
        // then
        XCTAssertEqual(expectedOperands, calculatorItemQueueOperands)
        XCTAssertEqual(expectedOperators, calculatorItemQueueOperators)
    }
    
    func test_Formula객체_result메소드가_제대로_작동하는지_확인() {
        // given
        let expectedResult = -25.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_0으로_나누었을때_infinity를_return하는지_확인() {
        // given
        let expectedResult = Double.infinity
        let inputString = "1 + 2 ÷ 3 ÷ 0 × 5 + 5"
        sut = ExpressionParser.parse(from: inputString)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
}
