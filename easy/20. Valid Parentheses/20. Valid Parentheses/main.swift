import Foundation

func isValid(_ s: String) -> Bool {
    var bracketStack = Array("")
    
    for ch in s {
        let length = bracketStack.count
        
        if ch == "(" || ch == "[" || ch == "{" {
            bracketStack += String(ch)
        } else if ch == ")" && length != 0 && bracketStack[length-1] == "(" {
            bracketStack.removeLast()
        } else if ch == "}" && length != 0 && bracketStack[length-1] == "{" {
            bracketStack.removeLast()
        } else if ch == "]" && length != 0 && bracketStack[length-1] == "[" {
            bracketStack.removeLast()
        } else {
            return false
        }
    }
    
    return bracketStack.count == 0
}

print(isValid("()"))
print(isValid("()[]{}"))
print(isValid("(]"))
print(isValid("]"))
