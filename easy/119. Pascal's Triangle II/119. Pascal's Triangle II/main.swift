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

func getNum(_ i: Int, _ j: Int) -> Int {
	if j == 0 || i == j {
		return 1
	}

	return getNum(i-1, j-1) + getNum(i-1, j)
}

func getRowRecursive(_ rowIndex: Int) -> [Int] {
    var res = [Int]()

    for i in 0...rowIndex {
        res.append(getNum(rowIndex, i))
    }

    return res
}

func getRowRecursiveBetter(_ rowIndex: Int) -> [Int] {
    if rowIndex == 0 {
        return [1]
    }

    var res = [Int]()
    var prevRow = getRowRecursiveBetter(rowIndex-1)
    for i in 0...rowIndex {
        res.append(1)
        var left = 0
        var right = 0

        if i > 0 {
			left = prevRow[i-1]
		}

		if i < rowIndex {
			right = prevRow[i]
		}

		res[i] = left + right
    }

    return res
}