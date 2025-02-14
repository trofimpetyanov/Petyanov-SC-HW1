import Foundation

public protocol Living {
    var food: Int { get set }

    func checkHealth() -> Bool
}

