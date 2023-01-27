//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Jason on 2023/01/19.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_Operator의_덧셈메서드를통해_결과값으로_더한값을_반환하는지() {
        // given
        let inputLhs = 1.0
        let inputRhs = 2.0
        
        
        // when
        let expectation = 3.0
        
        // then
        let result = Operator.add.calculate(lhs: inputLhs, rhs: inputRhs)
        XCTAssertEqual(expectation, result)
    }
    
    func test_Operator의_뺄셈메서드를통해_결과값으로_뺀값을_반환하는지() {
        // given
        let inputLhs = 1.0
        let inputRhs = 2.0
        
        // when
        let expectation = -1.0
        
        // then
        let result = Operator.subtract.calculate(lhs: inputLhs, rhs: inputRhs)
        XCTAssertEqual(expectation, result)
    }
    
    func test_Operator의_곱셈메서드를통해_결과값으로_곱셈값을_반환하는지() {
        // given
        let inputLhs = 1.0
        let inputRhs = 2.0
        
        // when
        let expectation = 2.0
        
        // then
        let result = Operator.multiply.calculate(lhs: inputLhs, rhs: inputRhs)
        XCTAssertEqual(expectation, result)
    }
    
    func test_Operator의_나눗셈_메서드를통해_결과값으로_곱셈값을_반환하는지() {
        // given
        let inputLhs = 1.0
        let inputRhs = 2.0
        
        // when
        let expectation = 0.5
        
        // then
        let result = Operator.divide.calculate(lhs: inputLhs, rhs: inputRhs)
        XCTAssertEqual(expectation, result)
    }
    
    func test_Operator의_사칙연산을_관리하는_메서드를통해_결과값이_Double타입인지() {
        // given
        let inputLhs = 1.0
        let inputRhs = 2.0
        
        let operatorArray: [Operator] = [.add, .subtract, .multiply, .divide]
        
        // when
        let expectation1 = 3.0
        let expectation2 = -1.0
        let expectation3 = 2.0
        let expectation4 = 0.5
        
        for element in operatorArray {
            switch element {
            case .add:
                let addResult = Operator.add.calculate(lhs: inputLhs, rhs: inputRhs)
                XCTAssertEqual(expectation1, addResult)
            case .subtract:
                let subtractResult = Operator.subtract.calculate(lhs: inputLhs, rhs: inputRhs)
                XCTAssertEqual(expectation2, subtractResult)
            case .multiply:
                let multiflyResult = Operator.multiply.calculate(lhs: inputLhs, rhs: inputRhs)
                XCTAssertEqual(expectation3, multiflyResult)
            case .divide:
                let divideResult = Operator.divide.calculate(lhs: inputLhs, rhs: inputRhs)
                XCTAssertEqual(expectation4, divideResult)
            }
        }
        
    }
}
