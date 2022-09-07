import Foundation

class Queue<T> {
    public var list: [T] = []
    
    public func removeAll() {
        list = []
    }
    
    public func enqueue(_ item: T) {
        list.append(item)
    }
    
    public func dequeue() {
        list.removeLast()
    }
}
