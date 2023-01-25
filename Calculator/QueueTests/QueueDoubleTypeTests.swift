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

    func test_queue가_만들어지고_내용이_비어있는지_확인() {
        XCTAssertTrue(sut.isEmpty())
    }

    func test_queue에_enqueue메서드로_요소가_추가되었는지_확인() {
        let inputValue: Double = 12.0
        sut.enqueue(inputValue)
        XCTAssertFalse(sut.isEmpty())
    }

    func test_queue에_dequeue메서드로_요소가_제거되었는지_확인() {
        let inputValue: Double = 12.0
        sut.enqueue(inputValue)
        sut.dequeue()
        XCTAssertTrue(sut.isEmpty())
    }

    func test_queue에서_dequeue가_제일_앞의_요소를_제거하는지_확인() {
        let inputValue: Double = 9.0
        let inputValue2: Double = 8.0
        let inputValue3: Double = 7.0

        sut.enqueue(inputValue)
        sut.enqueue(inputValue2)
        sut.enqueue(inputValue3)

        XCTAssertEqual(sut.dequeue(), inputValue)
    }

    func test_queue가_비어있을때_dequeue가_nil을_반환하는지_확인() {
        XCTAssertNil(sut.dequeue())
    }
}
