import Foundation

struct Queue<Element> {
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
    
    mutating func enqueue(_ item: Element) {
        list.append(item)
    }
    
    mutating func dequeue() {
        if !list.isEmpty {
            list.removeFirst()
        }
    }
}
