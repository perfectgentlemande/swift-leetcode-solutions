import Foundation

struct Cell {
    var i = 0
    var j = 0
}

struct Queue {
    private var items: [Cell] = []
        
    mutating func remove() -> Cell
    {
        return items.removeLast()
    }
        
    mutating func add(_ item: Cell) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }

    func count() -> Int {
        return items.count
    }
}


func wallsAndGates(_ rooms: inout [[Int]]) {
    var queue = Queue()
    
    for (rowIndex, rowValue) in rooms.enumerated() {
        for (columnIndex, cellValue) in rowValue.enumerated() {
            if cellValue == 0 {
                queue.add(Cell(i: rowIndex, j: columnIndex))
            }
        }
    }
    
    while !queue.isEmpty() {
        let cell = queue.remove()
        let i = cell.i
        let j = cell.j
        
        // down
        if i < rooms.count - 1 && rooms[i+1][j] == Int32.max {
            queue.add(Cell(i: i + 1, j: j))
            rooms[i+1][j] = rooms[i][j] + 1
        }
        
        // right
        if j < rooms[i].count - 1 && rooms[i][j+1] == Int32.max {
            queue.add(Cell(i: i, j: j + 1))
            rooms[i][j+1] = rooms[i][j] + 1
        }
        
        // up
        if i > 0 && rooms[i-1][j] == Int32.max {
            queue.add(Cell(i: i - 1, j: j))
            rooms[i-1][j] = rooms[i][j] + 1
        }
        
        // left
        if j > 0 && rooms[i][j-1] == Int32.max {
            queue.add(Cell(i: i, j: j - 1))
            rooms[i][j-1] = rooms[i][j] + 1
        }
    }
}

