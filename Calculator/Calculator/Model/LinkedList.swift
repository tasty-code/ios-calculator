//
//  LinkedList.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/16.
//

import Foundation

struct LinkedList<Element> {
    private var head: Node<Element>?
    
    func isHeadEmpty() -> Bool {
        return head == nil
    }
    
    func getHead() -> Node<Element>? {
        return head
    }
    
    mutating func append(data: Node<Element>) {
        if head == nil {
            head = data
            return
        }else {
            var node = head
            while node?.next != nil {
                node = node?.next
            }
            node?.next = data
        }
    }
    
    func removeLast() {
        let head = getHead()
//        guard let head else { return }
        
        var node = head
        var preNode: Node<Element>?
        while node?.next != nil {
            preNode = node
            node = node?.next
        }
        preNode?.next = nil
    }
}
