//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by Mason Kim on 2023/01/17.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTest: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_아무것도_담지_않았을때_head_tail이_nil이다() {
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_enqueue를_하면_해당값이_tail이_된다() {
        // given
        let input = 1.0
        
        // when
        sut.enqueue(input)
        guard let tail = sut.tail else {
            XCTFail()
            return
        }
        
        // then
        XCTAssertEqual(input, tail)
    }
    
    func test_dequeue를_하면_head값이_변경된다() {
        // given
        let inputs = [2.1, 1.5]

        inputs.forEach {
            sut.enqueue($0)
        }
        
        // when
        guard let beforeHead = sut.head else {
            XCTFail()
            return
        }
        
        sut.dequeue()
        
        guard let afterHead = sut.head else {
            XCTFail()
            return
        }
        
        // then
        XCTAssertNotEqual(beforeHead, afterHead)
        XCTAssertEqual(afterHead, inputs.last)
    }
}
