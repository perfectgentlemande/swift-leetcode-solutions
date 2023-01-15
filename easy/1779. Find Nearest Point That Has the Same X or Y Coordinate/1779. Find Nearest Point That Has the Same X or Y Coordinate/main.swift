import Foundation

func abs (_ v: Int) -> Int {
    if v < 0 {
        return -v
    }
    
    return v
}

func isValid(_ x: Int , _ y: Int, _ point: [Int]) -> Bool {
    if x == point[0] || y == point[1] {
        return true
    }

    return false
}

func manhattanDistance(_ x: Int, _ y: Int, _ point: [Int]) -> Int {
    return abs(x - point[0]) + abs(y - point[1])
}

func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
    if points.count == 0 {
        return -1
    }
    
    var curDistance = -1
    var curIndex = -1
    
    for i in 0...points.count-1 {
        if isValid(x, y, points[i]) {
            let newDistance = manhattanDistance(x, y, points[i])
            if curDistance == -1 || newDistance < curDistance {
                curDistance = newDistance
                curIndex = i
            }
        }
    }
    
    return curIndex
}

print(nearestValidPoint(3, 4, [[1,2], [3,2], [2,4], [2,3], [4,4]]))
print(nearestValidPoint(3, 4, [[3,4]]))
print(nearestValidPoint(3, 4, [[2,3]]))


