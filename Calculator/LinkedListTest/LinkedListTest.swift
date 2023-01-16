//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Mason Kim on 2023/01/16.
//

import XCTest
@testable import Calculator

final class LinkedListTest: XCTestCase {
    
    var sut: LinkedList!

    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_아무작업도_안했을때_head와_tail이_nil이다() {
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}
