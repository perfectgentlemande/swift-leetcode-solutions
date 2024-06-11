import Foundation

func count(grid: [[Character]], i: Int, j: Int) -> Int, Int {
    if grid[i][j] == 'W' {
        return 0, 1
    }

    return 1, 0
}


func canMakeSquare(_ grid: [[Character]]) -> Bool {
    if grid.count == 1 {
        return false
    }

    for i in 0 ..< grid.count-1 {
        for j in 0 ..< grid[i].count-1 {
            var c1 = 0
            var c2 = 0
            if grid[i][j] == "W" {
                c2 = 1
            } else {
                c1 = 1
            }
            
            var c11 = 0
            var c22 = 0
            if grid[i+1][j] == "W" {
                c22 = 1
            } else {
                c11 = 1
            }
            
            var c111 = 0
            var c222 = 0
            if grid[i][j+1] == "W" {
                c222 = 1
            } else {
                c111 = 1
            }
            
            
            var c1111 = 0
            var c2222 = 0
            if grid[i+1][j+1] == "W" {
                c2222 = 1
            } else {
                c1111 = 1
            }
            
            if c1+c11+c111+c1111 <= 1 || c2+c22+c222+c2222 <= 1 {
                return true
            }
        }
    }
    
    return false
}
