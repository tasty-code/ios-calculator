//
//  QueueTests.swift
//  QueueTests
//
//  Created by 이상윤 on 2023/01/16.
//

import XCTest

final class QueueTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_queue를_확인() {
        XCTAssertEqual(sut.queue, [])
    }
}
