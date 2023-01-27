//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by J.E on 2023/01/25.
//

import XCTest

final class OperatorTests: XCTestCase {
    var sut: Operator!

    override func setUp() {
        super.setUp()
        sut = Operator(rawValue: "+")
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_case에_해당되는_메서드가_실행된다() {
        let inputA = 1.1
        let inputB = 2.2
        let expectation = 1.1 + 2.2
        
        let result = sut.calculate(lhs: inputA, rhs: inputB)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_뺄셈함수가_정상작동한다() {
        sut = .subtract
        let inputA = 1.1
        let inputB = 2.2
        let expectation = 1.1 - 2.2
        
        let result = sut.calculate(lhs: inputA, rhs: inputB)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_나눗셈함수가_정상작동한다() {
        sut = .divide
        let inputA = 1.1
        let inputB = 2.2
        let expectation = 1.1 / 2.2
        
        let result = sut.calculate(lhs: inputA, rhs: inputB)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_곱셈함수가_정상작동한다() {
        sut = .multiply
        let inputA = 1.1
        let inputB = 2.2
        let expectation = 1.1 * 2.2
        
        let result = sut.calculate(lhs: inputA, rhs: inputB)
        
        XCTAssertEqual(result, expectation)
    }
}
