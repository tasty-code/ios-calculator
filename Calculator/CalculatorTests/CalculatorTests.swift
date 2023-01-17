//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jason on 2023/01/16.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorIemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
