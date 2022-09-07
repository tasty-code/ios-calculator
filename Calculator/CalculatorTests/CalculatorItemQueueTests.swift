import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: Queue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Double>()
    }

    override func tearDownWithError() throws {
       try super.tearDownWithError()
        sut = nil
    }
    
    func test_getListItem() {
        sut.enqueue(3)
        
        let result = sut.getListItem()
        
        XCTAssertEqual(result, [3])
    }
    
    func test_isEmpty() {
        sut.enqueue(3)
        
        let result = sut.isEmpty()
        
        XCTAssertEqual(result, false)
    }

    func test_enqueue() {
        let input = 12.5
        
        sut.enqueue(input)
        
        let result = sut.getListItem()
        
        XCTAssertEqual(result, [12.5])
    }
    
    func test_removeAll() {
        sut.enqueue(12.5)
        sut.enqueue(17.5)
        
        sut.removeAll()
        
        let result = sut.getListItem()
        
        XCTAssertEqual(result, [])
    }
    
    func test_dequeue() {
        sut.enqueue(12.5)
        sut.enqueue(17.5)
        
        sut.dequeue()
        
        let result = sut.getListItem()
        
        XCTAssertEqual(result, [12.5])
    }
}
