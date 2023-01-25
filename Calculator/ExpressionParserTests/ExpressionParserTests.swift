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

    private func generateInput(numbers inputNumbers: [Double], signs inputSigns: [String]) -> String {
        var input = ""
        for index in 0..<inputNumbers.count {
            input += String(inputNumbers[index])
            if inputSigns.count == index {
                return input
            }
            input += inputSigns[index]
        }
        return input
    }

    private func calculate(numbers inputNumbers: [Double], signs inputSigns: [String]) -> Double {
        var result = inputNumbers.first ?? 0.0
        for (index, sign) in inputSigns.enumerated() {
            switch sign {
            case "+":
                result += inputNumbers[index + 1]
            case "−":
                result -= inputNumbers[index + 1]
            case "×":
                result *= inputNumbers[index + 1]
            case "÷":
                result /= inputNumbers[index + 1]
            default:
                break
            }
        }
        return result
    }

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

    func test_parse메서드로_산출한_Formula의_result가_일치하는_값이다() {
        // given
        let inputNumbers = [1, 0, 10, 5.5, 5.5, 21, 1.1]
        let inputSigns = [addSign, subtractSign, multiplySign, divideSign, addSign, subtractSign]

        let input = generateInput(numbers: inputNumbers, signs: inputSigns)

        let expectation = calculate(numbers: inputNumbers, signs: inputSigns)

        // when
        var formula = ExpressionParser.parse(from: input)

        do {
            let result = try formula.result()
            // then
            XCTAssertEqual(result, expectation)
        } catch {
            XCTFail(error.localizedDescription)
        }
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
