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
    
    func test_빈큐에_3을_인큐하고_디큐했을_때_큐는_비어있다() {
        sut.enqueue(3)
        
        sut.dequeue()
        
        let result = sut.getListItem
        
        let emptyList: [Double] = []
        
        XCTAssertEqual(result, emptyList)
    }
    
    func test_빈큐에_디큐했을_때_오류가_발생하지_않는다() {
        sut.dequeue()
        
        let result = sut.getListItem
        
        let emptyList: [Double] = []
        
        XCTAssertEqual(result, emptyList)
    }
    
    func test_빈큐에_3을_인큐하고_큐리스트의_아이템을_가져온다() {
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
