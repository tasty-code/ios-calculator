//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Bora Yang on 2023/01/25.
//

import XCTest

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUp() {
        super.setUp()
        let operandsInput = CalculatorItemQueue(items: [0.0])
        let operatorsInput = CalculatorItemQueue(items: [Operator.add])
        sut = Formula(operands: operandsInput, operators: operatorsInput)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_피연산자가_1_2이고_연산자가_add일경우_결과값은_3이다() {
        sut.operands.enqueue(item: 1.0)
        sut.operands.enqueue(item: 2.0)
        sut.operators.enqueue(item: .add)
        sut.operators.enqueue(item: .add)
        let expectation = 0.0 + 1.0 + 2.0

        let result = try! sut.result()

        XCTAssertEqual(result, expectation)
    }

    func test_0으로_나누면_에러를_던진다() {
        sut.operands.enqueue(item: 0.0)
        sut.operators.enqueue(item: .divide)

        XCTAssertThrowsError(try sut.result())
    }
}
