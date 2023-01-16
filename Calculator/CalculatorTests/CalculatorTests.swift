//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Bora Yang on 2023/01/16.
//

import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUp() {
        super.setUp()
        sut = CalculatorItemQueue()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
