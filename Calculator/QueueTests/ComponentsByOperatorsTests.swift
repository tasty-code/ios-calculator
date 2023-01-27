//
//  ComponentsByOperatorsTests.swift
//  QueueTests
//
//  Created by 이상윤 on 2023/01/18.
//

import XCTest

final class ComponentsByOperatorsTests: XCTestCase {
    func test_연산자로_split이_되는지_확인() {
        let input = "1+22-10*3/2+3"
        let result = ExpressionParser.componentsByOperators(from: input)
        let expected = ["1","22","10","3","2","3"]
        XCTAssertEqual(result, expected)
    }

    func test_extractOperators의_반환값이_정확한지_확인() {
        let input = "1+22-10*3/2+3"
        let result = ExpressionParser.extractOperators(from: input)
        let expected: [Operator] = [.add, .subtract, .multiply, .divide, .add]
        XCTAssertEqual(result, expected)
    }

    func test_makeQueue의_input값이_잘들어갔는지_dequeue로_확인() {
        let input: [Double] = [1.0, 22.0, 10.0, 3.0, 2.0, 3.0]
        var result = ExpressionParser.makeQueue(from: input)

        for expected in input {
            let queueElement = result.dequeue()
            XCTAssertEqual(queueElement, expected)
        }
    }

    func test_result메서드가_올바른_계산이_되는지_확인() {
        let input = "+1+22-10*3/2+3"
        var fomula = ExpressionParser.parse(from: input)
        let result = fomula.result()
        let expected: Double = 22.5
        XCTAssertEqual(result, expected)
    }
}
