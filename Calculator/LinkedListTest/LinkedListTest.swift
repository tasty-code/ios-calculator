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
    
    func test_빈리스트의_head와_tail이_nil이다() {
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_비어있는_리스트에_removeFirst메서드_실행시_nil을_반환() {
        XCTAssertNil(sut.removeFirst())
    }
}
