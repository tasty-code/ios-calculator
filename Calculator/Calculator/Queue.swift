import Foundation

struct Queue<Element> {
    private var list: [Element] = []
    
    var count: Int {
        return list.count
    }
    
    func getListItem() -> [Element] {
        return list
    }
        
    mutating func removeAll() {
        list.removeAll()
    }
    
    mutating func enqueue(_ item: Element) {
        list.append(item)
    }
    
    mutating func dequeue() {
        list.removeLast()
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}
