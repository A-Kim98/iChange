import UIKit


func leastCoins(_ coins: [Int], _ amount: Int) -> [Double:Int] {
    
    var resultDict = [0.01:0, 0.05:0, 0.10:0, 0.25:0, 1.0:0, 2.0:0, 5:0, 10:0, 20:0, 50:0, 100:0]
    var change = amount
    let coinArray = coins.filter{$0 < amount}
    
    
    while change > 0 {
        for i in coinArray.reversed() {
            
            if (change / i > 0) {
                
                let coin = Double(i) / 100
                let count = change / i
                
                resultDict.updateValue(count, forKey: coin)
            }
            change = change % i
        }
    }
    
    return resultDict
}


//let startTime2 = CACurrentMediaTime()
//
////print(leastCoins([1, 5, 10, 25, 100, 200, 500, 1000, 2000, 5000, 10000], 191))
//
//print(2.159999)
//
//let endTime2 = CACurrentMediaTime()
//print("Total Runtime leastCoins: \(endTime2 - startTime2) s")




let a: Int? = Int("fiveDollarBillCount")
