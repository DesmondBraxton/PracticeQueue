import UIKit

// Implementing a q;ueue, using an array


class Queue<T> {
    var array = [T]()
    
    func enQueue(value: T) {
        array.append(value)
    }
    
    func deQueue() -> T? {
        if array.isEmpty {
           return nil
        } else { // removing the first element
           return array.remove(at: 0)
        }
    }
}

var queue = Queue<String>()
queue.enQueue(value: "hi")
queue.enQueue(value: "there")
    
queue.deQueue()



// Linked list queue

class LLQueueNode<T> {
    var data: T
    var next: LLQueueNode?
    
    init(val:T) {
        data = val
    }
}

class LLQueue<T>{
    var head: LLQueueNode<T>?
    var front: LLQueueNode<T>? { return head }
    var back:LLQueueNode<T>? { // We must know the last element of the data structure so we dont have to traverse
        // We create the new variable "node" and assign it to head; so that we dont have to change the value of the head node
        var node: LLQueueNode<T>? = self.head
        while (node?.next != nil) {
            node = node?.next
        }
        return node
    }
    
    // since these are entered at the back
    func enQueue(val: T) {
        var newNode = LLQueueNode(val: val)
        if let lastNode = back {
            lastNode.next = newNode
    } else {
        head = newNode
        }
    }
    func deQueue() -> T? {
        if head == nil {
            return nil
        }
        let temp = head
        if head?.next != nil {
            head = head?.next
        } else {
            head = nil
    }
    return temp?.data
    }
    func peek() -> T? {
        return head?.data
    }
}

var llqueue = LLQueue<Int>()

llqueue.enQueue(val: 1)
llqueue.enQueue(val: 2)

llqueue.deQueue()
