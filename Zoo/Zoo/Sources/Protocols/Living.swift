import Foundation

protocol Living {
    var food: Int { get set }

    func checkHealth() -> Bool
}

