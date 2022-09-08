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
    
    func test_Queue의_Dequeue가_작동하는지() {
        sut.enqueue(3)
        
        sut.dequeue()
        
        let result = sut.getListItem
        
        XCTAssertEqual(result, [])
    }
    
    func test_Queue가_비었을_때_Dequeue가_작동하는지() {
        sut.dequeue()
        
        let result = sut.getListItem
        
        XCTAssertEqual(result, [])
    }
    
    func test_Queue의_list값이_가져와지는지() {
        sut.enqueue(3)
        
        let result = sut.getListItem
        
        XCTAssertEqual(result, [3])
    }
    
    func test_Queue의_list요소가_비어있는지() {
        sut.enqueue(3)
        
        let result = sut.isEmpty
        
        XCTAssertEqual(result, false)
    }

    func test_Queue의_Enqueue가_작동하는지() {
        let input = 12.5
        
        sut.enqueue(input)
        
        let result = sut.getListItem
        
        XCTAssertEqual(result, [12.5])
    }
    
    func test_Queue의_List요소가_모두_제거되는지() {
        sut.enqueue(12.5)
        sut.enqueue(17.5)
        
        sut.removeAll()
        
        let result = sut.getListItem
        
        XCTAssertEqual(result, [])
    }
}
