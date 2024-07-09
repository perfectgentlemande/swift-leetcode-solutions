import Foundation

func minimumAverage(_ nums: [Int]) -> Double {
    var averages: [Double] = []
    var minAverage = 50.5

    var varNums = nums
    while varNums.count > 0 {
        var minI = 0
        var maxI = 0

        for (i, _) in varNums.enumerated() {
            if varNums[i] < varNums[minI] {
                minI = i
            }

            if varNums[i] > varNums[maxI] {
                maxI = i
            }
        }

        var average = (Double(varNums[minI]) + Double(varNums[maxI])) / 2
        if averages.count == 0 {
            minAverage = average
        }

        if average < minAverage {
            minAverage = average
        }
        averages.append(average)

        var newNums: [Int] = []
        
        for (i, _) in varNums.enumerated() {
            if i != maxI && i != minI {
                newNums.append(varNums[i])
            }
        }

        varNums = newNums
    }

    return minAverage
}

