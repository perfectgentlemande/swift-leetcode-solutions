import Foundation

class MyCircularQueue {
    private var vals: [Int]
    private var length: Int
    private var l: Int
    private var r: Int

    init(_ k: Int) {
        self.vals = Array(0...k-1)
        self.length = 0
        self.l = 0
        self.r = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        if self.isFull() {
            return false
        } else if self.isEmpty() {
            self.vals[self.l] = value
        } else {
            self.r = (self.r + 1) % self.vals.count
            self.vals[self.r] = value
        }
        
        self.length += 1
        
        return true
    }
    
    func deQueue() -> Bool {
        if self.isEmpty() {
            return false
        }
        
        self.vals[self.l] = -1
        if self.l != self.r {
            self.l = (self.l + 1) % self.vals.count
        }
        
        self.length -= 1
        
        return true
    }
    
    func Front() -> Int {
        if self.isEmpty() {
            return -1
        }
        
        return self.vals[self.l]
    }
    
    func Rear() -> Int {
        if self.isEmpty() {
            return -1
        }
        
        return self.vals[self.r]
    }
    
    func isEmpty() -> Bool {
        return self.length == 0
    }
    
    func isFull() -> Bool {
        return self.length == self.vals.count
    }
}
