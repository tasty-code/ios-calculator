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
}
