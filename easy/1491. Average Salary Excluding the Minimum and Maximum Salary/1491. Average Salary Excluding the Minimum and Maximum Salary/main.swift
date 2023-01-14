import Foundation

func average(_ salary: [Int]) -> Double {
    var min = 0
    var max = 0
    
    for i in 1...salary.count-1 {
        if salary[i] > salary[max] {
            max = i
        }
        if salary[i] < salary[min] {
            min = i
        }
    }
    
    var sum = 0
    for i in 0...salary.count-1 {
        if i != max && i != min {
            sum += salary[i]
        }
    }
    
    return Double(sum)/Double(salary.count - 2)
}

print(average([4000,3000,1000,2000]))
print(average([1000,2000,3000]))
