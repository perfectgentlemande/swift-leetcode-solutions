import Foundation

func romanToInt(_ s: String) -> Int {
    let numbersMap: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000,
    ]
    
    let chars = Array(s)
    var res: Int = numbersMap[chars[chars.count-1]]!
    
    var i = chars.count - 1
    
    while i > 0 {
        if numbersMap[chars[i]]! > numbersMap[chars[i-1]]! {
            res -= numbersMap[chars[i-1]]!
        } else {
            res += numbersMap[chars[i-1]]!
        }
        
        i-=1
    }
    
    return res
}

print(romanToInt("III"))
print(romanToInt("LVIII"))
print(romanToInt("MCMXCIV"))
