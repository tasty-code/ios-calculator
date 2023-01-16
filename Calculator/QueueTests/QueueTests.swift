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

    func test_queue를_확인() {
        let input: Int = 123
        sut.enqueue(input)
        XCTAssertEqual(sut.queue, [123])
    }

    func test_dequeue를_확인() {
        sut.dequeue()
        XCTAssertEqual(sut.queue, [])
    }
}
