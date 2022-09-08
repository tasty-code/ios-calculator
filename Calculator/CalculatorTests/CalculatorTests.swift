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
    
    func test_enqueue_and_dequeue_success() {
        let input = "test"
        sut.enqueue(input)
        
        guard let result: String = sut.dequeue() as? String else {
            return
        }
        
        XCTAssertEqual(result, "test")
    }

    func test_enqueue_and_dequeue_failed() {
        let input = "no"
        sut.enqueue(input)
        
        guard let result: String = sut.dequeue() as? String else {
            return
        }
        
        XCTAssertEqual(result, "yes")
    }

    func test_queue_isEmpty_method_success() {
        while !sut.isEmpty() {
            _ = sut.dequeue()
        }
        
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }

    func test_queue_isEmpty_method_failed() {
        sut.enqueue("test")
        
        let result = sut.isEmpty()
        
        XCTAssertFalse(result)
    }
    
}
