import Foundation

class StackNode {
    public var val: [Int]
    public var next: StackNode?
    public init() { self.val = [Int](); self.next = nil; }
    public init(_ val: [Int]) { self.val = val; self.next = nil; }
    public init(_ val: [Int], _ next: StackNode?) { self.val = val; self.next = next; }
}

class Stack {
    var root: StackNode?

    init() {
        root = nil
    }
    
    func push(_ val: [Int]) {
        var nextRoot = self.root

        self.root = StackNode(val, nextRoot)
    }
    
    func pop() -> [Int] {
        if self.root == nil {
            return [Int]()
        }

        let curVal = self.root!.val
        self.root = self.root!.next
        
        return curVal
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

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
    var newImage = image
    
    let height = newImage.count
    if height == 0 {
        return newImage
    }
    let width = newImage[0].count
    let srcColor = newImage[sr][sc]

    var explore = Stack()
    explore.push([sr, sc])

    while !explore.isEmpty() {
        // pop the last element in the stack
        let position = explore.pop()
        let i = position[0]
        let j = position[1]

        // top
        if i >= 1 && i-1 <= height-1 && image[i-1][j] == srcColor && newImage[i-1][j] != color {
            explore.push([i - 1, j])
        }

        // left
        if j >= 1 && j-1 <= width-1 && newImage[i][j-1] == srcColor && newImage[i][j-1] != color {
            explore.push([i, j - 1])
        }

        // right
        if j+1 <= width-1 && newImage[i][j+1] == srcColor && newImage[i][j+1] != color {
            explore.push([i, j + 1])
        }

        // bottom
        if i+1 <= height-1 && newImage[i+1][j] == srcColor && newImage[i+1][j] != color {
            explore.push([i + 1, j])
        }

        // color element
        newImage[i][j] = color
    }

    return newImage
}
