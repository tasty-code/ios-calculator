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
    
    func test_입력값이_0일때_result메서드를_실행하면_0을_반환하는지() {
        // given
        sut.operands.enqueue(element: 0.0)
        
        
        // when
        let expectation = 0.0
        
        // then
        let result = sut.result()
        XCTAssertEqual(expectation, result)
    }
    
    func test_입력값_하나만넣고_result메서드를_실행하면_해당_입력값을_반환하는지() {
        // given
        sut.operands.enqueue(element: 100.0)
        
        
        // when
        let expectation = 100.0
        
        // then
        let result = sut.result()
        XCTAssertEqual(expectation, result)
    }
}
