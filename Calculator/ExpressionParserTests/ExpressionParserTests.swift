//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 김보미 on 2023/01/19.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {

    func test_parse메서드에_연산식을_매개변수로_넣고_실행하면_operator에는_연산자만_operands에는_피연산자만_파싱된다() {
        // given
        let input = "1+3-20.3*99.56/23+5.0-9"
        let expectationOperators: [Operator] = [.add, .subtract, .multiply, .divide, .add, .subtract]
        let expectationOperands: [Double] = [1.0, 3.0, 20.3, 99.56, 23.0, 5.0, 9.0]

        // when
        var formula = ExpressionParser.parse(from: input)

        // then
        XCTAssertTrue(expectationOperators.allSatisfy { $0 == formula.operators.dequeue() })
        XCTAssertTrue(expectationOperands.allSatisfy { $0 == formula.operands.dequeue() })
    }
}
