import Foundation

func clearDigits(_ s: String) -> String {
    var stack: [Character] = []

    for ch in s {
        if ch >= "a" && ch <= "z" {
            stack.append(ch)
        } else {
            stack.removeLast()
        }
    }
       
    return String(stack)
}

