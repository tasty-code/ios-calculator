//
//  ExtensionLinkedList.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/25.
//

import Foundation

extension LinkedList {
    
    func myLinkedListDataMap() -> [Element]? {
        guard let head = self.getHead() else { return nil }
        
        var result:[Element] = []
        result.append(head.data)
        
        var nodeHead = head
        while true {
            guard let next = nodeHead.next else { return result }
            result.append(next.data)
            
            nodeHead = next
        }
        return result
    }
    
    
    
    func myLinkedListFilter(filterableFunc: (Node<Element>) -> Bool) -> [Element]? {
        guard let head = self.getHead() else { return nil }
        var result:[Element] = []
        
        if filterableFunc(head){
            result.append(head.data)
        }
        var nodeHead = head
        while true {
            guard let next = nodeHead.next else { return result }
            if filterableFunc(next){
                result.append(next.data)
            }
            nodeHead = next
        }
        return result
    }
}
