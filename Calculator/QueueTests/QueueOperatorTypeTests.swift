//
//  QueueOperatorTypeTests.swift
//  QueueTests
//
//  Created by 이상윤 on 2023/01/17.
//

import XCTest

final class QueueOperatorTypeTests: XCTestCase {
    var sut: CalculateItemQueue<Operator>!
    
    override func setUpWithError() throws {
        sut = CalculateItemQueue<Operator>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue로_item이_들어갔는지_확인() {
        let input: Operator = .multiply
        sut.enqueue(input)
        XCTAssertEqual(sut.queue, [input])
    }

    func test_dequeue의_반환값이_item인지_확인() {
        let input: Operator = .multiply
        sut.enqueue(input)
        XCTAssertEqual(sut.dequeue(), input)
    }
    
    func test_dequeue의_반환값이_nil인지_확인() {
        XCTAssertNil(sut.dequeue())
    }

    func test_dequeue가_제대로_되었는지_확인() {
        let input: Operator = .add
        let input1: Operator = .divide
        let input2: Operator = .subtract
        sut.enqueue(input)
        sut.enqueue(input1)
        sut.enqueue(input2)
        sut.dequeue()
        XCTAssertEqual(sut.queue, [input1, input2])
    }

    func test_allClear를_확인() {
        let input: Operator = .add
        sut.enqueue(input)
        sut.enqueue(input)
        sut.enqueue(input)
        sut.allClear()
        XCTAssertEqual(sut.queue, [])
    }
}
