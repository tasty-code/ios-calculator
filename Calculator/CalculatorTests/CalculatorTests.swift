//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Schro on 2022/09/07.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test() {
        sut.enqueue("test")
        XCTAssertEqual(sut.dequeue(), "test")
    }
    
    func enqueue_and_dequeue_test_성공() {
        sut.enqueue("test")
        XCTAssertEqual(sut.dequeue(), "test")
    }

    func enqueue_and_dequeue_test_실패() {
        sut.enqueue("no")
        XCTAssertEqual(sut.dequeue(), "yes")
    }

    func queue_isEmpty_method_test_성공() {
        XCTAssertEqual(sut.isEmpty(), true)
    }

    func queue_isEmpty_method_test_실패() {
        XCTAssertEqual(sut.isEmpty(), false)
    }
    
}
