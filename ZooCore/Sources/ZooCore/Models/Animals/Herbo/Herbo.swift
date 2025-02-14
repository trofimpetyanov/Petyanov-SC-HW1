import Foundation

public class Herbo: Animal {
    public var kindnessLevel: Int
    
    public init(food: Int, number: Int, name: String, kindnessLevel: Int) {
        self.kindnessLevel = kindnessLevel
        super.init(food: food, number: number, name: name)
    }
    
    public var isContactZooCompatible: Bool {
        return kindnessLevel > 5
    }
} 