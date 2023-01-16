//
//  QueueTests.swift
//  QueueTests
//
//  Created by 이상윤 on 2023/01/16.
//

import XCTest

final class QueueTests: XCTestCase {
    var sut: CalculateItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculateItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue를_확인() {
        let input: Int = 123
        sut.enqueue(input)
        XCTAssertEqual(sut.queue, [123])
    }

    func test_dequeue의_반환값이_123인지_확인() {
        sut.enqueue(123)
        XCTAssertEqual(sut.dequeue(), 123)
    }
    
    func test_dequeue의_반환값이_nil인지_확인() {
        XCTAssertNil(sut.dequeue())
    }
    
    func test_dequeue가_제대로_되었는지_확인() {
        sut.enqueue(123)
        sut.enqueue(456)
        sut.enqueue(789)
        sut.dequeue()
        XCTAssertEqual(sut.queue, [456, 789])
    }
    
    func test_allClear를_확인() {
        let input: Int = 123
        sut.enqueue(input)
        sut.enqueue(input)
        sut.enqueue(input)
        sut.allClear()
        XCTAssertEqual(sut.queue, [])
    }
}
