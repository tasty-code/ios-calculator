//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by 이은호 on 2022/09/07.
//

import XCTest
@testable import Calculator

class CalculatorTest: XCTestCase {
    var sut: CalculatorItemQueue<Any>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testExample_수가_잘_들어가는지_확인하는_함수() {
        let input = 1
        
        sut.enqueue(input)
        
        let empty = sut.isEmpty
        
        XCTAssertFalse(empty)
        
    }
    
    func testqueue에서첫번째값이_반환되는지확인하는함수() {
        let input = 1

        sut.enqueue(input)
        
        let expectation = sut.dequeue()
        let result = 1

        XCTAssertEqual(result, expectation as! Int)
        
        }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
