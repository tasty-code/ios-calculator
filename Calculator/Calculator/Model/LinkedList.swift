//
//  LinkedList.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/17.
//

import Foundation

class LinkedList<T> {
    var head: Node<T>?
    
    func enqueue(value: T) {
        if head == nil {
            head = Node(value: value)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(value: value)
    }
}
// [node - linkedList - Queue] = 하나의 저장소
// [node-linkedlist] [node-linkedlist]
