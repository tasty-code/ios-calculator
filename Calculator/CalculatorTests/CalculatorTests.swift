//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 조용현 on 2023/01/20.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_CalculatorItemQueue_Double타입값이_담기는가() throws {
        //given
//        var doubleTest = CalculatorItemQueue<Double>()
        let doubleNumber = 2.0
        
        //when
        sut.enqueue(value: doubleNumber)
        
        //then
        XCTAssertEqual(doubleNumber, sut.queue[0] as? Double)
    }
    
    func test_CalculatorItemQueue_isEmpty가_동작하는가() throws {
        //given
        let emptyTest = true
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertEqual(emptyTest, result)
    }
    
    func test_CalculatorItemQueue_맨앞에_값이_삭제되는가() throws {
        //given
        let firstInput = 1.0
        
        //when
        sut.enqueue(value: 1.0)
        sut.enqueue(value: 2.0)
        sut.enqueue(value: 3.0)
        
        //then
        XCTAssertEqual(firstInput, sut.queue.removeFirst() as? Double)
    }
    
    func test_CalculatorItemQueue_queue_값이_비어있으면_nil이_반환되는가() throws {
        XCTAssertNil(sut.dequeue())
    }
}

//@testable import Calculator
//
//final class CalculatorTests: XCTestCase {
//
//    var sut: LinkedList!
//
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        sut = LinkedList()
//    }
//
//    override func tearDownWithError() throws {
//        try super.tearDownWithError()
//        sut = nil
//    }
//
//    func test_LinkedList_number에_양수값이_담기는가() throws {
//        //given
//        let inputNumber = 12.0
//        let inputOperation = Operation.add
//
//        //when
//        sut.enqueue(number: inputNumber, operation: inputOperation)
//
//        //then
//        XCTAssertEqual(inputNumber, sut.head?.number)
//    }
//
//    func test_LinkedList_number에_음수값이_담기는가() throws {
//        //given
//        let inputNumber = -23.2
//        let inputOperation = Operation.add
//
//        //when
//        sut.enqueue(number: inputNumber, operation: inputOperation)
//
//        //then
//        XCTAssertEqual(inputNumber, sut.head?.number)
//    }
//
//}
