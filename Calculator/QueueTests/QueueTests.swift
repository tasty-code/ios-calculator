//
//  QueueTests.swift
//  QueueTests
//
//  Created by 이상윤 on 2023/01/16.
//

import XCTest

final class QueueTests: XCTestCase {
    var sut: CalculateItemQueue<Item>!
    
    override func setUpWithError() throws {
        sut = CalculateItemQueue<Item>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue로_item이_들어갔는지_확인() {
        let input: Item = Item(value: 13.0, toggle: .positive, operator: .addition)
        sut.enqueue(input)
        XCTAssertEqual(sut.queue, [input])
    }

    func test_dequeue의_반환값이_item인지_확인() {
        let input: Item = Item(value: 13.0, toggle: .positive, operator: .addition)
        sut.enqueue(input)
        XCTAssertEqual(sut.dequeue(), input)
    }
    
    func test_dequeue의_반환item의_value가_같은지_확인() {
        let input: Item = Item(value: 13.0, toggle: .positive, operator: .addition)
        sut.enqueue(input)
        XCTAssertEqual(sut.dequeue()?.value, input.value)
    }
    
    func test_dequeue의_반환값이_nil인지_확인() {
        XCTAssertNil(sut.dequeue())
    }

    func test_dequeue가_제대로_되었는지_확인() {
        let input: Item = Item(value: 123, toggle: .positive, operator: .addition)
        let input1: Item = Item(value: 456, toggle: .positive, operator: .addition)
        let input2: Item = Item(value: 789, toggle: .positive, operator: .addition)
        sut.enqueue(input)
        sut.enqueue(input1)
        sut.enqueue(input2)
        sut.dequeue()
        XCTAssertEqual(sut.queue, [input1, input2])
    }

    func test_allClear를_확인() {
        let input: Item = Item(value: 123, toggle: .positive, operator: .addition)
        sut.enqueue(input)
        sut.enqueue(input)
        sut.enqueue(input)
        sut.allClear()
        XCTAssertEqual(sut.queue, [])
    }
}
