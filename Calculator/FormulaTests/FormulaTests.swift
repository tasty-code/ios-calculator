//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Jason on 2023/01/20.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {

    var sut: Formula!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result메서드를_실행하면_Double을_반환하는지() {
        // given
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: 1.0)
        operands.enqueue(element: 2.0)
        
        // when
        let expectation = 3.0
        
        // then
        let result = sut.result()
        XCTAssertEqual(expectation, result)
    }
}
