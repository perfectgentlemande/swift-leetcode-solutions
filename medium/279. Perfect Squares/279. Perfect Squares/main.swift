import Foundation

struct Queue {
    private var items: [Int] = []
    
    mutating func remove() -> Int {
        return items.removeFirst()
    }
    
    mutating func add(_ item: Int) {
        items.append(item)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
    
    func count() -> Int {
        return items.count
    }
}

func numSquares(_ n: Int) -> Int {
    var visited = Array(repeating: false, count: n+1)
    var queue = Queue()
    queue.add(n)
    visited[n] = true
    var count = 0
    while queue.count() > 0 {
        let size = queue.count()
        for _ in 0..<size {
            let cur = queue.remove()
            if cur == 0 {
                return count
            }
            var i = 1
            while cur - i * i >= 0 {
                if !visited[cur - i * i] {
                    queue.add(cur - i * i)
                    visited[cur - i * i] = true
                }
                i += 1
            }
        }
        count += 1
    }
    return count
}

print(numSquares(12))
print(numSquares(13))
print(numSquares(7168))
