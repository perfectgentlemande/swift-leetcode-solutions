import Foundation

func fib(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    
    return fib(n - 1) + fib(n - 2)
}

var fibResults = [Int: Int]()

func fibWithMemoization(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    
    var res = -1
	if fibResults[n] == nil {
		res = fibWithMemoization(n-1) + fibWithMemoization(n-2)
		fibResults[n] = res
	}

	return fibResults[n]!
}