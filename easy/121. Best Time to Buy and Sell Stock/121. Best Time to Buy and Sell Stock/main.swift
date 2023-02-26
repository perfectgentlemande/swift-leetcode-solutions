import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var curSell = 0
    var profit = 0
    
    var i = prices.count - 1
    while i >= 0 {
        if prices[i] > curSell {
            curSell = prices[i]
        } else {
            let tmpProfit = curSell - prices[i]
            if tmpProfit > profit {
                profit = tmpProfit
            }
        }
        
        i-=1
    }
    
    return profit
}
