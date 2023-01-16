//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김용재 on 2023/01/16.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_3_4를_enque했을때_총_element숫자가_2개인지() {
        //given
        let givenCountNumber = 2
        
        //when
        sut.enqueue(3)
        sut.enqueue(4)
        let actualCountNumber = sut.count
        
        //then
        XCTAssertEqual(actualCountNumber, givenCountNumber)
    }
    
    func test_dequeue시_첫번째element가_삭제되는지() {
        //given
        let setData = [3]
        sut.data = setData
        
        //when
        let dequeuedData = sut.dequeue()
        
        //then
        XCTAssertEqual(3, dequeuedData)
    }
    
    func test_빈_Queue일때_isEmpty가_true를_반환하는지() {
        XCTAssertTrue(sut.isEmpty)
    }
}
