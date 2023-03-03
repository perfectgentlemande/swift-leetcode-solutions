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

var directions: [[Int]] = [[1, 0], [-1, 0], [0, -1], [0, 1]]

func isValid(_ y: Int, _ x: Int, _ grid: [[Character]], _ visited: [[Bool]]) -> Bool {
    if y >= grid.count || y < 0 {
        return false
    } else if x >= grid[0].count || x < 0 {
        return false
    } else if grid[y][x] == "0" {
        return false
    } else if visited[y][x] {
        return false
    }

    return true
}

func numIslands(_ grid: [[Character]]) -> Int {
    var visited = [[Bool]]()
    
    for (index, row) in grid.enumerated() {
        visited.append([Bool]())
        for _ in row {
            visited[index].append(false)
        }
    }
    
    var numIslands = 0
    
    for (i, _) in grid.enumerated() {
        for (j, _) in grid[i].enumerated() {
            if grid[i][j] == "1" && !visited[i][j] {
                var queue = Queue()
                queue.add(Cell(i: i, j: j))
                
                while !queue.isEmpty() {
                    var curr = queue.remove()
                    
                    for direction in directions {
                        let x = curr.i + direction[0]
                        let y = curr.j + direction[1]
                        
                        if isValid(x, y, grid, visited) {
                            visited[x][y] = true
                            queue.add(Cell(i: x, j: y))
                        }
                    }
                }
                
                numIslands += 1
            }
        }
    }
    
    return numIslands
}
