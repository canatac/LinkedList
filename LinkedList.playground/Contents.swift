//: Playground - noun: a place where people can play

import Cocoa

public class LinkedListNode<T> {
 var value: T
 var next: LinkedListNode?
 weak var previous: LinkedListNode?

 public init(value: T){
  self.value = value
 }
}

public class LinkedList<T>{
 public typealias Node = LinkedListNode<T>

 private var head: Node?

 public var isEmpty: Bool {
  return head == nil
 }

 public var first: Node? {
  return head
 }

 public var last: Node? {
  if var node = head {
   while case let next? = node.next {
    node = next
   }
   return node
  }else{
   return nil
  }
 }

 public func append(value: T) {
  let newNode = Node(value: value)
  if let lastNode = last {
   newNode.previous = lastNode
   lastNode.next = newNode
  }else{
   head = newNode
  }
 }

 public var count: Int {
  if var node = head {
   var c = 1
   while case let next? = node.next {
    node = next
    c += 1
   }
   return c
  }else{
   return 0
  }
 }

}

let list = LinkedList<String>()
list.isEmpty
list.first
list.append(value: "Hello")
list.isEmpty
list.first!.value
list.last!.value

list.append(value: "World")
list.first!.value
list.last!.value
list.first!.previous
list.first!.next!.value
list.last!.previous!.value
list.last!.next

list.count

