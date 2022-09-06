//
//  Queue.swift
//  Calculator
//
//  Created by Lim Chae Yoon on 2022/09/06.
//

import Foundation

class Queue<T> {
    var list: [T] = []
    
    func removeAll() {
        list = []
    }
    
    func enqueue(_ item: T) {
        list.append(item)
    }
    
    func dequeue() {
        list.removeLast()
    }
}
