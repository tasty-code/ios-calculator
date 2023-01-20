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
        do {
            let result = try sut.result()
            XCTAssertEqual(result, 0)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_연산식을_enqueue한_후_result메서드_실행시_예상한_결과값을_반환한다() {
        // given 연산식: 5 + 9 * 20 / 8 - 7
        let expectation = 28.0
        var operators = CalculatorItemQueue<Operator>()
        var operands = CalculatorItemQueue<Double>()

        // when
        operators.enqueue(.add)
        operators.enqueue(.multiply)
        operators.enqueue(.divide)
        operators.enqueue(.subtract)

        operands.enqueue(5.0)
        operands.enqueue(9.0)
        operands.enqueue(20.0)
        operands.enqueue(8.0)
        operands.enqueue(7.0)

        sut = Formula(operands: operands, operators: operators)

        do {
            let result = try sut.result()
            // then
            XCTAssertEqual(expectation, result)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
