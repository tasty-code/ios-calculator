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
            return XCTFail()
        }
        
        // then
        XCTAssertEqual(input, headValue)
        XCTAssertEqual(input, tailValue)
    }
}
