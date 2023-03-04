import Foundation

struct Frame {
    var lock: [Int]
    var steps: Int
}

struct Queue {
    private var items: [Frame] = []
    
    mutating func remove() -> Frame {
        return items.removeFirst()
    }
    
    mutating func add(_ item: Frame) {
        items.append(item)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
    
    func count() -> Int {
        return items.count
    }
}

func getKey(_ s: String) -> [Int] {
    var key = [Int]()
    
    for char in s {
        key.append(Int(String(char))!)
    }

    return key
}

func getChildCombos(_ lock: [Int]) -> [[Int]] {
    var childLocks = [[Int]]()
        
    for (i, _) in lock.enumerated() {
        var newLockUp = lock
        var newLockDown = lock
        
        newLockUp[i] += 1
        newLockUp[i] %= 10
            
        childLocks.append(newLockUp)
        
        if newLockDown[i] == 0 {
            newLockDown[i] = 9
        } else {
            newLockDown[i] -= 1
        }
            
        childLocks.append(newLockDown)
    }
        
    return childLocks
}

func openLock(_ deadends: [String], _ target: String) -> Int {
    let targetKey = getKey(target)
        
    var visited: Set<[Int]> = []
    for deadend in deadends {
        visited.insert(getKey(deadend))
    }
        
    var q = Queue()
    q.add(Frame(lock: [0,0,0,0], steps: 0))
        
    while !q.isEmpty() {
        let f = q.remove()
            
        if visited.contains(f.lock) {
            continue
        } else if f.lock == targetKey {
            return f.steps
        } else {
            visited.insert(f.lock)
        }
            
        for childLock in getChildCombos(f.lock) {
            q.add(Frame(lock: childLock, steps: f.steps + 1))
        }
    }

    return -1
}
print(openLock(["0201","0101","0102","1212","2002"], "0202"))
