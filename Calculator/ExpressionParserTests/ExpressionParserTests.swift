//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 김보미 on 2023/01/19.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {

    let addSign = "+"
    let subtractSign = "−"
    let multiplySign = "×"
    let divideSign = "÷"

    func test_parse메서드에_연산식을_매개변수로_넣고_실행하면_operator에는_연산자만_operands에는_피연산자만_파싱된다() {
        // given
        let input = "1\(addSign)3\(subtractSign)20.3\(multiplySign)99.56\(divideSign)23\(addSign)5.0\(subtractSign)-9"
        let expectationOperators: [Operator] = [.add, .subtract, .multiply, .divide, .add, .subtract]
        let expectationOperands: [Double] = [1.0, 3.0, 20.3, 99.56, 23.0, 5.0, -9.0]

        // when
        var formula = ExpressionParser.parse(from: input)

        // then
        XCTAssertTrue(expectationOperators.allSatisfy { $0 == formula.operators.dequeue() })
        XCTAssertTrue(expectationOperands.allSatisfy { $0 == formula.operands.dequeue() })
    }

    func test_parse메서드로_산출한_Fomula의_result가_일치하는_값이다() {
        // given
        let input = "1\(addSign)0\(subtractSign)10\(multiplySign)5.5\(divideSign)5.5\(addSign)21\(subtractSign)1.1"
        let expectation = 10.9

        // when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()

        // then
        XCTAssertEqual(result, expectation)
    }
}
