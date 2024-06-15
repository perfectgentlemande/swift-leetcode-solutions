import Foundation

func findLatestTime(_ s: String) -> String {
    if s.count != 5 {
        return ""
    }

    var chStr = Array(s)

    if chStr[0] == "?" && chStr[1] == "?" {
        chStr[0] = "1"
        chStr[1] = "1"
    } else {
        if chStr[0] == "?" {
            if chStr[1] <= "1" {
                chStr[0] = "1"
            } else {
                chStr[0] = "0"
            }
        }

        if chStr[1] == "?" {
            if chStr[0] == "1" {
                chStr[1] = "1"
            } else {
                chStr[1] = "9"
            }
        }
    }

    if chStr[4] == "?" {
        chStr[4] = "9"
    }
    if chStr[3] == "?" {
        chStr[3] = "5"
    }

    return String(chStr)
}
