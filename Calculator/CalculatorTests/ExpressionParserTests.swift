//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Bora Yang on 2023/01/25.
//

import XCTest

extension Formula: Equatable {
    static func == (lhs: Formula, rhs: Formula) -> Bool {
        lhs.operands.items == rhs.operands.items && lhs.operators.items == rhs.operators.items
    }
}

final class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_완성된_계산식이_연산자와_피연산자로_올바르게_분리되는지_확인한다() {
        let input = "0+5−6÷7×8"
        let operandsInput = CalculatorItemQueue(items: [0, 5, 6, 7, 8])
        let operatorsInput = CalculatorItemQueue(items: Operator.allCases)
        let expectation = Formula(operands: operandsInput, operators: operatorsInput)

        let result = ExpressionParser.parse(from: input)

        XCTAssertEqual(result, expectation)
    }
}
