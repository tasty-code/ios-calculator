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

    func test_queue가_만들어지고_내용이_비어있는지_확인() {
        XCTAssertTrue(sut.isEmpty())
    }

    func test_queue에_enqueue메서드로_요소가_추가되었는지_확인() {
        let inputValue: Operator = .add
        sut.enqueue(inputValue)
        XCTAssertFalse(sut.isEmpty())
    }

    func test_queue에_dequeue메서드로_요소가_제거되었는지_확인() {
        let inputValue: Operator = .divide
        sut.enqueue(inputValue)
        sut.dequeue()
        XCTAssertTrue(sut.isEmpty())
    }

    func test_queue에서_dequeue가_제일_앞의_요소를_제거하는지_확인() {
        let inputValue: Operator = .add
        let inputValue2: Operator = .divide
        let inputValue3: Operator = .multiply

        sut.enqueue(inputValue)
        sut.enqueue(inputValue2)
        sut.enqueue(inputValue3)

        XCTAssertEqual(sut.dequeue(), inputValue)
    }

    func test_queue가_비어있을때_dequeue가_nil을_반환하는지_확인() {
        XCTAssertNil(sut.dequeue())
    }
}
