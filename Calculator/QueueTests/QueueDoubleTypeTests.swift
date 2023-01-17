//
//  QueueDoubleTypeTests.swift
//  QueueTests
//
//  Created by 이상윤 on 2023/01/16.
//

import XCTest

final class QueueDoubleTypeTests: XCTestCase {
    var sut: CalculateItemQueue<Double>!
    
    override func setUpWithError() throws {
        sut = CalculateItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue로_item이_들어갔는지_확인() {
        let input: Double = 13.0
        sut.enqueue(input)
        XCTAssertEqual(sut.queue, [input])
    }

    func test_dequeue의_반환값이_item인지_확인() {
        let input: Double = 13.0
        sut.enqueue(input)
        XCTAssertEqual(sut.dequeue(), input)
    }
    
    func test_dequeue의_반환값이_nil인지_확인() {
        XCTAssertNil(sut.dequeue())
    }

    func test_dequeue가_제대로_되었는지_확인() {
        let input: Double = 123
        let input1: Double = 456
        let input2: Double = 789
        sut.enqueue(input)
        sut.enqueue(input1)
        sut.enqueue(input2)
        sut.dequeue()
        XCTAssertEqual(sut.queue, [input1, input2])
    }

    func test_allClear를_확인() {
        let input: Double = 123
        sut.enqueue(input)
        sut.enqueue(input)
        sut.enqueue(input)
        sut.allClear()
        XCTAssertEqual(sut.queue, [])
    }
}
