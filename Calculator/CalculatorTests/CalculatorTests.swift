//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 정연호 on 2022/09/05.
//

import XCTest

protocol CalculateItem {
    
}

enum CalculatorError : Error {
    case noValue
}

struct CalculatorItem {
    var sign: String
    var number: Double
}

class Queue<T> {
    var list: [T]
    var count: Int {
        get {
            return list.count
        }
    }
    
    func enqueue(_ item: T) {
        list.append(item)
    }
    
    func dequeue() -> T {
        return list.removeFirst()
    }
    
    func peak() throws -> T {
        if let item = list.first {
            return item
        } else {
            throw CalculatorError.noValue
        }
    }
    
    func clear() {
        list.removeAll()
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    init(_ list: [T] = []) {
        self.list = list
    }
}

class CalculatorItemQueue : Queue<CalculatorItem>, CalculateItem {
    private var result: Double = 0.0
    
    func getResult() -> Double {
        return result
    }
    
    func setResult(in value: Double) {
        result = value
    }
}

class CalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
