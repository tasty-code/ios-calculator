//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Schro on 2022/09/06.
//

import XCTest

class CalculatorTests: XCTestCase {
    var test: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        test = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        test = nil
    }
    
    func enqueue_and_dequeue_test() {
        test.enqueue("1")
        XCTAssertEqual(test.dequeue(), "1")
    }
}
