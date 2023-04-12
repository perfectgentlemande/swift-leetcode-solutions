import Foundation

struct Pair: Hashable {
    var X: Double = 0.0
    var N: Int = 0
    
    init(_ x: Double, _ n: Int) {
        self.X = x
        self.N = n
    }
}


var myPows =  [Pair: Double]()

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    }

    if n == 1 {
        return x
    }

    if n < 0 {
        return 1 / myPow(x, -n)
    }

    var pair = Pair(x, n)

    var res = myPows[pair]
    if res == nil {
        if n%2 == 1 {
            res = x * myPow(x, n-1)
        } else {
            res = myPow(x*x, n/2)
        }
        myPows[pair] = res
    }

    return res!
}
