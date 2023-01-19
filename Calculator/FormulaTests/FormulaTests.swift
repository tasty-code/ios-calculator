//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 김보미 on 2023/01/19.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_비어있는_operators와_operands의_result가_0이다() {
        XCTAssertEqual(sut.result(), 0)
    }

    func test_연산식을_enqueue한_후_result메서드_실행시_예상한_결과값을_반환한다() {
        // given 연산식: 5 + 9 * 20 / 8 - 7
        let expectation = 28.0

        // when
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.multiply)
        sut.operators.enqueue(.divide)
        sut.operators.enqueue(.subtract)

        sut.operands.enqueue(5.0)
        sut.operands.enqueue(9.0)
        sut.operands.enqueue(20.0)
        sut.operands.enqueue(8.0)
        sut.operands.enqueue(7.0)

        let result = sut.result()

        // then
        XCTAssertEqual(expectation, result)
    }
}
