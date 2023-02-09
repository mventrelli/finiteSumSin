import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("sin(x) calculation")
                .font(.largeTitle)
                .padding()
            ForEach(Array(1...10), id: \.self) { i in
                Text("For x = \(i), sin(x) is: \(sin(x: Double(i)))")
                    .font(.title)
                    .padding()
            }
            ForEach(Array(10...100), id: \.self) { i in
                Text("For x = \(i), sin(x) is: \(sin(x: Double(i)))")
                    .font(.title)
                    .padding()
            }
        }
    }
    
    func sin(x: Double) -> Double {
        let terms = 50
        var sum = 0.0
        for n in 0..<terms {
            let numerator = pow(-1, Double(n)) * pow(x, Double(2 * n + 1))
            let denominator = factorial(n: 2 * n + 1)
            sum += numerator / denominator
            if abs(numerator / denominator) < 1e-7 {
                break
            }
        }
        return sum
    }
    
    func factorial(n: Int) -> Double {
        if n == 0 {
            return 1
        }
        var result = 1.0
        for i in 1...n {
            result *= Double(i)
        }
        return result
    }
}
