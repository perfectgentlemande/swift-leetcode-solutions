import Foundation

func satisfiesConditions(_ grid: [[Int]]) -> Bool {
    for (i, row) in grid.enumerated() {
        for (j, cell) in grid[i].enumerated() {
            if i < grid.count-1 {
                if grid[i][j] != grid[i+1][j] {
                    return false
                }
            }

            if j < grid[i].count-1 {
                if grid[i][j] == grid[i][j+1] {
                    return false
                }
            }
        }
    }
    
    return true
}

