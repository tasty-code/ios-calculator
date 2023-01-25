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

    func test_입력이_없는_경우_에러를_반환한다() {
        // given
        let input = ""

        // when
        var formula = ExpressionParser.parse(from: input)

        // then
        XCTAssertThrowsError(try formula.result())
    }

    func test_연산자와_피연산자_갯수가_적절하지_않은경우_에러를_반환한다() {
        // given
        let input1 = "1\(addSign)0\(subtractSign)\(subtractSign)10\(multiplySign)5.5"
        let input2 = "1\(addSign)0\(subtractSign)10\(multiplySign)5.5\(subtractSign)"
        let input3 = "\(subtractSign)1\(addSign)0\(subtractSign)10\(multiplySign)5.5"
        let input4 = "1\(addSign)0\(multiplySign)\(multiplySign)\(subtractSign)10\(multiplySign)5.5"

        // when
        var formula1 = ExpressionParser.parse(from: input1)
        var formula2 = ExpressionParser.parse(from: input2)
        var formula3 = ExpressionParser.parse(from: input3)
        var formula4 = ExpressionParser.parse(from: input4)

        // then
        XCTAssertThrowsError(try formula1.result())
        XCTAssertThrowsError(try formula2.result())
        XCTAssertThrowsError(try formula3.result())
        XCTAssertThrowsError(try formula4.result())
    }

    func test_0으로_나눌시_에러를_반환한다() {
        // given
        let input1 = "1\(divideSign)0\(subtractSign)10\(multiplySign)5.5"
        let input2 = "100\(divideSign)0"
        let input3 = "\(subtractSign)1\(divideSign)0\(subtractSign)10\(multiplySign)5.5"
        let input4 = "1\(addSign)0\(multiplySign)10\(divideSign)0.0"

        // when
        var formula1 = ExpressionParser.parse(from: input1)
        var formula2 = ExpressionParser.parse(from: input2)
        var formula3 = ExpressionParser.parse(from: input3)
        var formula4 = ExpressionParser.parse(from: input4)

        // then
        XCTAssertThrowsError(try formula1.result())
        XCTAssertThrowsError(try formula2.result())
        XCTAssertThrowsError(try formula3.result())
        XCTAssertThrowsError(try formula4.result())
    }
}
