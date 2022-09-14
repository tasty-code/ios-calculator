import Foundation

struct CalculatorItemQueue<Element>: CalculatorItem {
    private var list: [Element] = []
    
    var count: Int {
        return list.count
    }
    
    var getListItem: [Element] {
        return list
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
        
    mutating func clear() {
        list.removeAll()
    }
    
    mutating func enqueue(_ items: Element) {
        list.append(items)
    }
    
    mutating func dequeue() -> Element? {
        if !list.isEmpty {
            return list.removeFirst()
        }
        
        return nil
    }
}
