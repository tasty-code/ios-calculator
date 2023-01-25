//
//  TemporaryInputTests.swift
//  CalculatorTests
//
//  Created by J.E on 2023/01/25.
//

import XCTest

final class TemporaryInputTests: XCTestCase {
    var sut: TemporaryInput!
    
    override func setUp() {
        super.setUp()
        sut = TemporaryInput()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // 비었는지 확인
    func test_피연산자_목록이_비어있지_않으면_false이다() {
        let input = "1"
        
        sut.addOperand(newNumber: input)
        
        XCTAssertFalse(sut.partailOperandsIsEmpty())
    }
    
    func test_연산자와_피연산자_부호_조합이_정상적으로_완성되는지_확인한다() {
        let inputA: Character = "×"
        let inputB = "3"
        let expectation = "×-3"

        sut.changeOperator(to: inputA)
        sut.addOperand(newNumber: inputB)
        sut.toggleSignValue()
        
        XCTAssertEqual(sut.makePair(), expectation)
    }
}
