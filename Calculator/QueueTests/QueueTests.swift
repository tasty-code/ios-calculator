//
//  QueueTests.swift
//  QueueTests
//
//  Created by 이상윤 on 2023/01/16.
//

import XCTest

final class QueueTests: XCTestCase {
    var sut: CalculateItemQueue<Operator>!
    
    override func setUpWithError() throws {
        sut = CalculateItemQueue<Operator>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue로_Operator가_들어갔는지_확인() {
        let input: Operator = .addition
        sut.enqueue(input)
        XCTAssertEqual(sut.queue, [input])
    }

    func test_dequeue의_반환값이_Operator인지_확인() {
        let input: Operator = .division
        sut.enqueue(input)
        XCTAssertEqual(sut.dequeue(), input)
    }
    
    func test_dequeue의_반환값이_nil인지_확인() {
        XCTAssertNil(sut.dequeue())
    }

    func test_dequeue가_제대로_되었는지_확인() {
        let input: Operator = .addition
        let input1: Operator = .subtraction
        let input2: Operator = .multiplication
        sut.enqueue(input)
        sut.enqueue(input1)
        sut.enqueue(input2)
        sut.dequeue()
        XCTAssertEqual(sut.queue, [input1, input2])
    }

    func test_allClear를_확인() {
        let input: Operator = .division
        sut.enqueue(input)
        sut.enqueue(input)
        sut.enqueue(input)
        sut.allClear()
        XCTAssertEqual(sut.queue, [])
    }
}
