//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 정재근 on 2022/09/05.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue에_수가_추가되는지() {
        let input = 10
        
        sut.enqueue(input)
        let empty = sut.isEmpty
        
        XCTAssertFalse(empty)
    }
    
    func test_queue에서_첫번째값이_반환되는지확인하는함수() {
        let input = 12
            
        sut.enqueue(input)
        let expectation = sut.dequeue()
            
        XCTAssertEqual(expectation, 12)
    }

    func test_queue의_값이_모두지워지는지() {
        let input1 = 15
        let input2 = 16
        
        sut.enqueue(input1)
        sut.enqueue(input2)
        sut.clearAll()
        let empty = sut.isEmpty
        
        XCTAssertTrue(empty)
    }
    
    func test_queue의_마지막값이_지워지는지() {
        let input1 = 1
        let input2 = 7
        
        sut.enqueue(input1)
        sut.enqueue(input2)
        sut.removeLast()
        let result = sut.getQueue()
        
        XCTAssertEqual(result, [1])
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
