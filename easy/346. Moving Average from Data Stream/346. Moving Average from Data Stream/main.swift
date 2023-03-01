import Foundation

class MovingAverage {
    var vals: [Int]
    var length: Int
    var size: Int

    init(_ size: Int) {
        self.vals = Array(0...size-1)
        for cntr in 0...size-1 {
            self.vals[cntr] = 0
        }
        self.length = 0
        self.size = size
    }
    
    func isFull() -> Bool {
        return self.length == self.vals.count
    }
    
    private func add(_ v: Int) {
        if !self.isFull() {
            self.vals[self.length] = v
            self.length += 1
        } else {
            self.vals.remove(at: 0)
            self.vals.append(v)
        }
    }
    
    func next(_ val: Int) -> Double {
        self.add(val)

        var sum = 0
        for v in self.vals {
            sum += v
        }

        return Float64(sum) / Float64(self.length)
    }
}

var ma = MovingAverage(3)
print("next:" + String(ma.next(1)))
print(ma.vals)
print(ma.length)
print(ma.size)
print("next:" +  String(ma.next(10)))
print("next:" +  String(ma.next(3)))
print("next:" +  String(ma.next(5)))
