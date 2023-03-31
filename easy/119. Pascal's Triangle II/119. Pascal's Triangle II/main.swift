import Foundation

func getRow(_ rowIndex: Int) -> [Int] {
    var res = [[Int]]()

    for i in 0...rowIndex {
        res.append([Int]())

        for j in 0...i {
            res[i].append(0)
            
            if j == 0 || i == j {
                res[i][j] = 1
            } else {
                res[i][j] = res[i-1][j-1] + res[i-1][j]
            }
        }
    }

    return res[rowIndex]
}
