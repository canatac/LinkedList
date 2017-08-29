//: Playground - noun: a place where people can play

import Cocoa

public class LinkedListNode<T: Any where T: Equatable> {
 var value: T
 var next: LinkedListNode?
 weak var previous: LinkedListNode?

 public init(value: T){
  self.value = value
 }

}

extension LinkedListNode : Equatable {
 public static func ==<T>(lhs:LinkedListNode<T>, rhs:LinkedListNode<T>) -> Bool{
  return lhs.value == rhs.value
 }

}

public class LinkedList<T: Any where T: Equatable>{
 public typealias Node = LinkedListNode<T>
 var cycle:Bool? = false

 private var head: Node?

 public init(cycle: Bool? = false){
  self.cycle = cycle
 }

 public var isEmpty: Bool {
  return head == nil
 }

 public var first: Node? {
  return head
 }

 public var last: Node? {
  if var node = head {
   if let cycleTmp = self.cycle {
    print("CYCLE : \(cycleTmp)")
    if cycleTmp {
     if let next = node.next {
      print("THE VALUE READ IS : \(next.value)")
      print("ITS PREVIOUS WAS : \(node.value)")
      next.previous = node
      node = next
      print("NOW THE LAST NODE IS : \(node.value)")
      print("ITS PREVIOUS IS : \(node.previous!.value)")
      print("ITS NEXT IS : \(node.next!.value)")

      if node.next == node.previous {
       return node
      }
     }
    } else {
     while case let next? = node.next {
      next.previous = node
      node = next
     }
    }
   }else{
    while case let next? = node.next {
     next.previous = node
     node = next
    }
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
   // ADD A CYCLE
   if let cycleTmp = self.cycle {
    if cycleTmp {
     newNode.next = newNode.previous
    }
   }
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


func hasCycle(head:LinkedListNode<String>) -> Bool {
 // GO TO THE LAST AND SEE IF NEXT RETURNS NIL OR NOT
 // IF NIL : NO CYCLE
 // IF NOT NIL = CYCLE
 var node = head
 while case let next? = node.next {
  if node.next == node.previous {
   return true
  }else{
   node = next
  }
 }
 return false
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

hasCycle(head: list.first!)

let cycleList = LinkedList<String>(cycle:true)
cycleList.isEmpty
cycleList.first
cycleList.append(value: "Hello")
cycleList.isEmpty
cycleList.first!.value
cycleList.last!.value

cycleList.append(value: "World")
cycleList.first!.value
cycleList.last!.value
cycleList.first!.previous
cycleList.first!.next!.value
cycleList.last!.previous!.value
cycleList.last!.next?.value

hasCycle(head: cycleList.first!)
