//
//  LinkedList.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/16.
//

import Foundation

struct LinkedList {
    private var head: Node?
    
    func isHeadEmpty() -> Bool {
        return head == nil
    }
    
    func getHead() -> Node? {
        return head
    }
    
    mutating func inqueue(data: Node) {
        if head == nil {
            head = data
            return
        }
        
        var node = head
        while node?.next == nil {
            node = node?.next
        }
        node?.next = Node(data: data.data)
    }
    
    func dequeue() {
        
    }
    
}
