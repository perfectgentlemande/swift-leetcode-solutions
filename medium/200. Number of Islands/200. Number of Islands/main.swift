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

class Node {
    public var val: [Int]
    public var next: Node?
    public init() { self.val = [Int](); self.next = nil; }
    public init(_ val: [Int]) { self.val = val; self.next = nil; }
    public init(_ val: [Int], _ next: Node?) { self.val = val; self.next = next; }
}

class Stack {
    var root: Node?

    init() {
        root = nil
    }
    
    func push(_ val: [Int]) {
        var nextRoot = self.root

        self.root = Node(val, nextRoot)
    }
    
    func pop() {
        if self.root == nil {
            return
        }

        self.root = self.root!.next
    }
    
    func top() -> [Int] {
        if self.root == nil {
            return [Int]()
        }

        return self.root!.val
    }
    
    func isEmpty() -> Bool {
        return self.root == nil
    }
}

let land: Character = "1"
let water: Character = "0"

func numIslandsDFS(_ grid: [[Character]]) -> Int {
    var visited = [[Int]]()
    
    for (i, row) in grid.enumerated() {
        visited.append([Int]())
        
        for _ in row {
            visited[i].append(0)
        }
    }

    var count = 0

    for (i, row) in grid.enumerated() {
        for (j, cell) in row.enumerated() {
            if (cell == land) && (visited[i][j] == 0) {
                // explore on it, and mark the current island as visited
                // so we don't re-count it
                markIsland(grid, &visited, [i, j])
                count += 1
            }
        }
    }

    return count
}

// pos x,y
func markIsland(_ grid: [[Character]], _ visited: inout [[Int]], _ pos: [Int]) {
    let height = grid.count
    let width = grid[0].count

    var explore = Stack()
    explore.push(pos)

    while !explore.isEmpty() {
        // pop the last element in the stack
        let position = explore.top()
        explore.pop()

        let i = position[0]
        let j = position[1]

        // top
        if i >= 1 && i-1 <= height-1 && grid[i-1][j] == land && visited[i-1][j] == 0 {
            explore.push([i - 1, j])
        }

        // left
        if j >= 1 && j-1 <= width-1 && grid[i][j-1] == land && visited[i][j-1] == 0 {
            explore.push([i, j - 1])
        }

        // right
        if j+1 <= width-1 && grid[i][j+1] == land && visited[i][j+1] == 0 {
            explore.push([i, j + 1])
        }

        // bottom
        if i+1 <= height-1 && grid[i+1][j] == land && visited[i+1][j] == 0 {
                explore.push([i + 1, j])
        }

        // mark the current element as explored
        visited[i][j] = 1
    }
}
