//
//  LinkedList.swift
//  Calculator
//
//  Created by 신동오 on 2023/01/17.
//

import Foundation

final class LinkedList {
    private var head: ItemNode?
    private var tail: ItemNode?
    private var numberOfNodes: Int = 0
    
    func append(data: String) {
        if head == nil {
            head = ItemNode(data: data)
            tail = head
            
            numberOfNodes += 1
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = ItemNode(data: data)
        tail = node?.next
        
        numberOfNodes += 1
    }
    
    func remove() -> String? {
        guard head != nil else {
            return nil
        }
        
        let result: String?
        
        result = head?.data
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        numberOfNodes -= 1
        return result
    }
    
    func count() -> Int {
        return self.numberOfNodes
    }
}
