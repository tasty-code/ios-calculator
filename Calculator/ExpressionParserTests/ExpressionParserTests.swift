//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Jason on 2023/01/25.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {

    var sut: Formula!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_parse메서드를_호출하면_Fomular형태로_반환하는지() {
        // given
        sut.operands.enqueue(element: 100.0)
        sut.operands.enqueue(element: 50.0)
        sut.operators.enqueue(element: .add)
        
        // when
        
        // then
        let result = ExpressionParser.parse(from: "100.0+50.0")
//        XCTAssert
        XCTAssertEqual(Formula(operands: sut.operands, operators: sut.operators), result)
    }
    
    func test_parse메서드를_사용하여_생성한_formula_안에_올바른_값들이_저장됐는지() {
        let userInputNumber1 = 30.0
        let userInputOperator = Operator.add
        let userInputNumber2 = 50.0
        
        let userInput: String = String(userInputNumber1) + String(userInputOperator.rawValue) + String(userInputNumber2)
        print(userInput)
        var result = ExpressionParser.parse(from: userInput)
        let operandsExpectation1 = result.operands.popHead()
        let operandsExpectation2 = result.operands.popHead()
        let operatorExpectation = result.operators.popHead()
              
        XCTAssertEqual(operandsExpectation1, userInputNumber1)
        XCTAssertEqual(operandsExpectation2, userInputNumber2)
        XCTAssertEqual(operatorExpectation, userInputOperator)
    }
    
    func test_ExpressionParser의_Formula의_result메서드가_올바른_값을_반환하는지() {
        let input = "123+456-789*111/555"
        let expectation = -42.0
        var formula = ExpressionParser.parse(from: input)
        
        let result = formula.result()
        XCTAssertEqual(expectation, result)
        
    }
}
