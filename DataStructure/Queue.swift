//
//  Queue.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-08-04.
//

import Foundation

/// The Queue class represents a first-in-first-out (FIFO) queue of generic items.
/// It supports the usual *eunque* and *dequeue* operations, along with methods for peeking at the first item, testing if the queue is empty, and iterating through the items in FIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Queue<E> {
    /// number of elements in bag
    private(set) var index: Int = 0
    /// beginning of bag
    private var first: Node<E>? = nil
    
    public init() { }

    fileprivate class Node<E> {
        fileprivate var value: E
        fileprivate var next: Node<E>?
        
        fileprivate init(value: E, next node: Node<E>? = nil) {
            self.value = value
            self.next = node
        }
    }
        
    /// Returns true if this bag is empty.
    /// - Returns: true if this bag is empty, otherwise false.
    public func isEmpty() -> Bool {
      return first == nil
    }
    
    public func enqueue(value: E) {
        let node = Node<E>(value: value)
        if let first = self.first {
            node.next = first
            self.first = node
        } else {
            self.first = node
        }
        self.index += 1
    }
    
    func dequeue() -> E? {
        guard let first = self.first else { return nil }
        let node = first
        self.first = first.next
        node.next = nil
        self.index -= 1
        return node.value
    }
    
    func peak() -> E? {
        return first?.value
    }
}

extension Queue: Sequence {
    public struct StackIterator<E>: IteratorProtocol {
        public typealias Element = E
        
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.value {
                self.current = current?.next
                return item
            }
            return nil
        }
    }
    
    public func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(first)
    }
}
