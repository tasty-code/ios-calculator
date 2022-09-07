import Foundation

class Queue<Element> {
    public var list: [Element] = []
    
    public func removeAll() {
        list = []
    }
    
    public func enqueue(_ item: Element) {
        list.append(item)
    }
    
    public func dequeue() {
        list.removeLast()
    }
    
    public func isEmpty() -> Bool {
        return list.isEmpty
    }
    
    public func getListCount() -> Int {
        return list.count
    }
}
