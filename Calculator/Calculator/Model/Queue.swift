import Foundation

struct Queue<Element> {
    private var list: [Element] = []
    
    var count: Int {
        return list.count
    }
    
    var getListItem: [Element] {
        return list
    }
        
    mutating func removeAll() {
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
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}
