import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    
    if strs.count == 1 {
        return strs[0]
    }
    
    var res = ""
    
    for (index, value) in strs[0].enumerated() {
        var willBeAdded = true
        
        var i = 1
        while i < strs.count {
            if index >= strs[i].count || value != Array(strs[i])[index] {
                willBeAdded = false
                break
            }
            i += 1
        }
        
        if willBeAdded {
            res += String(value)
        } else {
            break
        }
    }
    
    return res
}

print(longestCommonPrefix(["flower","flow","flight"]))
print(longestCommonPrefix(["dog","racecar","car"]))
print(longestCommonPrefix(["cir","car"]))
