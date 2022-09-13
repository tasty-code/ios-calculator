import Foundation

class CalculatorItemQueue<Element>: CalculatorItem {
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
        
    func clear() {
        list.removeAll()
    }
    
    func enqueue(_ item: Element) {
        list.append(item)
    }
    
    func dequeue() {
        if !list.isEmpty {
            list.removeFirst()
        }
    }
    
    public func getCalculatorItems() -> [Element] {
        return list
    }
}

protocol CalculatorItem {
    
}


extension Double: CalculatorItem {
    
}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
