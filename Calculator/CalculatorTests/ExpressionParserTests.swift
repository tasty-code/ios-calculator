//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Bora Yang on 2023/01/25.
//

import XCTest

final class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_완성된_계산식에서_연산자들이_올바르게_분리되는지_확인한다() {
            let input = "0+5−6÷7×8"
            let operandsInput = CalculatorItemQueue(items: [0, 5, 6, 7, 8])
            let operatorsInput = CalculatorItemQueue(items: Operator.allCases)
            let expectation = Formula(operands: operandsInput, operators: operatorsInput).operands.items

            let result = ExpressionParser.parse(from: input).operands.items

            XCTAssertEqual(result, expectation)
        }

        func test_완성된_계산식에서_피연산자들이_올바르게_분리되는지_확인한다() {
            let input = "0+5−6÷7×8"
            let operandsInput = CalculatorItemQueue(items: [0, 5, 6, 7, 8])
            let operatorsInput = CalculatorItemQueue(items: Operator.allCases)
            let expectation = Formula(operands: operandsInput, operators: operatorsInput).operators.items

            let result = ExpressionParser.parse(from: input).operators.items

            XCTAssertEqual(result, expectation)
        }
}
