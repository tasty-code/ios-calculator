//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Bora Yang on 2023/01/16.
//

import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUp() {
        super.setUp()
        sut = CalculatorItemQueue()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_빈배열이면_true이다() {
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }

    func test_빈배열이_아니면_false이다() {
        let input = "a"
        
        sut.enqueue(item: "a")
        let result = sut.isEmpty()
        
        XCTAssertFalse(result)
    }

    func test_배열의_요소_개수를_반환한다() {
        let inputA = "a"
        let inputB = "b"
        
        sut.enqueue(item: inputA)
        sut.enqueue(item: inputB)
        let result = sut.count()
        
        XCTAssertEqual(result, 2)
    }

    func test_배열에_추가한_순서대로_저장된다() {
        let inputA = "a"
        let inputB = "b"
        
        sut.enqueue(item: inputA)
        sut.enqueue(item: inputB)
        let result = sut.items
        
        XCTAssertEqual(result, ["a", "b"])
    }

    func test_배열에_추가한_순서대로_삭제된다() {
        let inputA = "a"
        let inputB = "b"
        
        sut.enqueue(item: inputA)
        sut.enqueue(item: inputB)
        do {
            try sut.dequeue()
            let result = sut.items
            XCTAssertEqual(result, ["b"])
        } catch {

        }
    }

    func test_빈배열에서_요소를_삭제를_시도하면_에러를_던진다() {
        XCTAssertThrowsError(try sut.dequeue())
    }
}
