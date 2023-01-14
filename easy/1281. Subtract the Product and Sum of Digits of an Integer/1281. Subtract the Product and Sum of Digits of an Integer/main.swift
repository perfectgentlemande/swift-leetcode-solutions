import Foundation

func subtractProductAndSum(_ n: Int) -> Int {
    var product = 1
    var sum = 0
    
    var num = n
    
    while num > 0 {
        let digit = num % 10
        
        product *= digit
        sum += digit
        
        num = num / 10
    }
    
    return product - sum
}

print(subtractProductAndSum(234))
print(subtractProductAndSum(4421))
