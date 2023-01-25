//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Mason Kim on 2023/01/16.
//

import XCTest
@testable import Calculator

final class LinkedListTest: XCTestCase {

    var sut: LinkedList<Any>!

    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_비어있는_리스트의_head와_tail이_nil이다() {
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }

    func test_비어있는_리스트에_removeFirst메서드_실행시_nil을_반환() {
        XCTAssertNil(sut.removeFirst())
    }

    func test_비어있는_리스트에_append메서드_실행시_해당요소는_head이자_tail이다() throws {
        // given
        let input = "mason"

        // when
        sut.append(input)
        guard let headValue = sut.head?.value as? String,
            let tailValue = sut.tail?.value as? String else {
            XCTFail()
            return
        }

        // then
        XCTAssertEqual(input, headValue)
        XCTAssertEqual(input, tailValue)
    }

    func test_여러요소를_append했을때_마지막으로_넣은_요소가_tail이다() {
        // given
        let inputs = [1, 2, 3, 4, 5]

        // when
        inputs.forEach {
            sut.append($0)
        }
        guard let tailValue = sut.tail?.value as? Int else {
            XCTFail()
            return
        }

        // then
        XCTAssertEqual(inputs.last, tailValue)
    }

    func test_removeFirst메서드_실행시_처음넣은_요소를_제거하고_리턴한다() {
        // given
        let inputs = [1, 2, 3, 4, 5]

        inputs.forEach {
            sut.append($0)
        }

        // when
        guard let result = sut.removeFirst() as? Int else {
            XCTFail()
            return
        }
        let expectation = inputs.first

        // then
        XCTAssertEqual(result, expectation)
    }

    func test_여러요소를_append했을때_첫번째가_head이고_마지막이_tail이다() {
        // given
        let inputs = [1, 2, 3, 4, 5]

        // when
        inputs.forEach {
            sut.append($0)
        }
        guard let tailValue = sut.tail?.value as? Int,
            let headValue = sut.head?.value as? Int else {
            XCTFail()
            return
        }

        // then
        XCTAssertEqual(inputs.last, tailValue)
        XCTAssertEqual(inputs.first, headValue)
    }

    func test_removeFirst메서드_실행시_head가_다음값으로_바뀐다() {
        // given
        let inputs = [1, 2, 3, 4, 5]

        inputs.forEach {
            sut.append($0)
        }

        // when
        sut.removeFirst()
        guard let headValue = sut.head?.value as? Int else {
            XCTFail()
            return
        }
        let expectation = inputs[1]

        // then
        XCTAssertEqual(headValue, expectation)
    }

    func test_여러요소를_append_했을때_각_노드가_next로_연결되어있다() {
        // given
        let inputs = [1, 2, 3, 4, 5]

        // when
        inputs.forEach {
            sut.append($0)
        }

        let firstNode = sut.head
        let secondNode = firstNode?.next
        let thirdNode = secondNode?.next
        let fourthNode = thirdNode?.next
        let fifthNode = fourthNode?.next

        // then
        XCTAssertIdentical(sut.tail, fifthNode)
    }

    func test_append실행후_removeFirst를_실행하면_head와_tail이_모두_nil이다() {
        sut.append("mason")
        sut.removeFirst()

        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}
