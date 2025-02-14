import Foundation

public class Animal: Living, Inventoriable {
    public var food: Int
    public var number: Int
    public var name: String
    
    public init(food: Int, number: Int, name: String) {
        self.food = food
        self.number = number
        self.name = name
    }
    
    public func checkHealth() -> Bool {
        return true
    }
} 
