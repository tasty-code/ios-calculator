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
        XCTAssertNil(sut.front)
        XCTAssertNil(sut.rear)
    }

    func test_enqueue를_하면_해당값이_tail이_된다() {
        // given
        let input = 1.0

        // when
        sut.enqueue(input)
        guard let tail = sut.rear else {
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
        guard let beforeHead = sut.front else {
            XCTFail()
            return
        }

        sut.dequeue()

        guard let afterHead = sut.front else {
            XCTFail()
            return
        }

        // then
        XCTAssertNotEqual(beforeHead, afterHead)
        XCTAssertEqual(afterHead, inputs.last)
    }

    func test_모든요소들을_삭제했을때_count가_0이다() {
        // given
        let inputs = [2.1, 1.5]

        inputs.forEach {
            sut.enqueue($0)
        }

        // when
        for _ in 1...inputs.count {
            sut.dequeue()
        }

        // then
        XCTAssertEqual(sut.count, 0)
    }


    func test_빈큐에_dequeue했을때_count가_0이다() {
        sut.dequeue()

        XCTAssertEqual(sut.count, 0)
    }


    func test_요소를_2개_enqueue했을때_count가_2이다() {
        // given
        let inputs = [2.1, 1.5]

        // when
        inputs.forEach {
            sut.enqueue($0)
        }

        // then
        XCTAssertEqual(sut.count, 2)
    }
}
