//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by 김용재 on 2023/01/20.
//

import XCTest
@testable import Calculator

final class ExpressionParserTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_특정_string을_받았을때_Formula객체가_제대로_생성되는지_확인() {
        // given
        let inputString = "1,a,2,s,3,d,-4,m,-5,a,0"
        let expectedOperands = [1.0, 2.0, 3.0, -4.0, -5.0, 0.0]
        let expectedOperators = [Operator.add, Operator.substract, Operator.divide, Operator.multiply, Operator.add]
        
        // when
        let formula = ExpressionParser.parse(from: inputString)
        let calculatorItemQueueOperands = formula.operands.elements
        let calculatorItemQueueOperators = formula.operators.elements
        
        // then
        XCTAssertEqual(expectedOperands, calculatorItemQueueOperands)
        XCTAssertEqual(expectedOperators, calculatorItemQueueOperators)
    }
}
