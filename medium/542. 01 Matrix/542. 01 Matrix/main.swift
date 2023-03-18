import Foundation

struct Cell : Hashable {
    var i = 0
    var j = 0
    
    public init() { self.i = 0; self.j = 0; }
    public init(_ i: Int, _ j: Int) { self.i = i; self.j = j; }
}
struct CellWithDistance {
    var cell = Cell()
    var distance = 0
    
    public init() { self.cell = Cell(); self.distance = 0; }
    public init(_ c: Cell, _ distance: Int) { self.cell = c; self.distance = distance; }
}

class QueueNode {
    public var val: CellWithDistance
    public var next: QueueNode?
    public init() { self.val = CellWithDistance(); self.next = nil; }
    public init(_ val: CellWithDistance) { self.val = val; self.next = nil; }
    public init(_ val: CellWithDistance, _ next: QueueNode?) { self.val = val; self.next = next; }
}


class Queue {
    var root: QueueNode?
    var rear: QueueNode?
    var size: Int

    init() {
        root = nil
        rear = nil
        size = 0
    }
    
    func add(_ val: CellWithDistance) {
        var node = QueueNode(val)

        if self.root == nil {
            self.root = node
        }
        
        if self.rear != nil {
            self.rear!.next = node
        }

        self.rear = node
        self.size += 1
    }
    
    func remove() -> CellWithDistance {
        if self.root == nil {
            return CellWithDistance()
        }

        var curVal = self.root!.val
        if self.root === self.rear {
            self.rear = nil
        }
        self.root = self.root!.next
        self.size -= 1

        return curVal
    }
    
    func head() -> CellWithDistance {
        if self.root == nil {
            return CellWithDistance()
        }

        return self.root!.val
    }
    
    func isEmpty() -> Bool {
        return self.root == nil
    }
}


func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
    var matCopy = mat
    
    let height = mat.count
    let width = mat[0].count

    var seen = Set<Cell>()
    var queue = Queue()

    for (i, _) in mat.enumerated() {
        for (j, _) in mat[i].enumerated() {
            if mat[i][j] == 0 {
                seen.insert(Cell(i, j))
                queue.add(CellWithDistance(Cell(i, j), 1))
            }
        }
    }

    while !queue.isEmpty() {
        let cur = queue.remove()

        for d in [Cell(0, 1), Cell(1, 0), Cell(0, -1), Cell(-1, 0)] {
            var newCell = Cell(cur.cell.i + d.i, cur.cell.j + d.j)

            if newCell.i < 0 ||
                newCell.i >= height ||
                newCell.j < 0 ||
                newCell.j >= width ||
                seen.contains(Cell(newCell.i, newCell.j)) {
                continue
            }

            seen.insert(Cell(newCell.i, newCell.j))
            queue.add(CellWithDistance(Cell(newCell.i, newCell.j), cur.distance + 1))
            matCopy[newCell.i][newCell.j] = cur.distance
        }
    }

    return matCopy
}

