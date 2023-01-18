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
}
