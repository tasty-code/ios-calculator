import Foundation

class Queue<Element> {
    private var list: [Element] = []
    
    func getListItem() -> [Element] {
        return list
    }
        
    func removeAll() {
        list.removeAll()
    }
    
    func enqueue(_ item: Element) {
        list.append(item)
    }
    
    func dequeue() {
        list.removeLast()
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
    
    func getListCount() -> Int {
        return list.count
    }
}
