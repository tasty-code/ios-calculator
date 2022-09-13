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

    // Queue에 수가 잘 들어가는지 확인하는 함수 (아직은 주석을 쓰다가 정확히 이해하면 지울것)
    func testQueue에_숫자1을enqueue하고_isEmpty로확인해보면_결과는True() {
        let input = 1
        
        sut.enqueue(input)
        
        let empty = sut.isEmpty
        
        XCTAssertFalse(empty)
        
    }
    
    // Queue에 들어간 첫번째수가 잘 지워지는지 확인하는 함수
    func testQueue에_숫자1을enqueue하고_dequeue한값을상수에넣어_숫자1과비교해보면_결과는True() {
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
