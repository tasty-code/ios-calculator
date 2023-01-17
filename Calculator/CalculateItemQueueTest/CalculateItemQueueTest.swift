//
//  CalculateItemQueueTest.swift
//  CalculateItemQueueTest
//
//  Created by Mason Kim on 2023/01/17.
//

import XCTest
@testable import Calculator

final class CalculateItemQueueTest: XCTestCase {
    
    var sut: CalculateItemQueue<Any>!

    override func setUpWithError() throws {
        sut = CalculateItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_아무것도_담지_않았을때_head_tail이_nil이다() {
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_enqueue를_하면_해당값이_tail이_된다() {
        let input = "AAA"
        
        sut.enqueue(input)
        guard let tail = sut.tail as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(input, tail)
    }
    
    func test_dequeue를_하면_head값이_변경된다() {
        let inputs = ["mason", "blue"]

        inputs.forEach {
            sut.enqueue($0)
        }
        
        guard let beforeHead = sut.head as? String else {
            XCTFail()
            return
        }
        
        sut.dequeue()
        
        guard let afterHead = sut.head as? String else {
            XCTFail()
            return
        }
        
        XCTAssertNotEqual(beforeHead, afterHead)
        XCTAssertEqual(afterHead, inputs.last)
    }
}
