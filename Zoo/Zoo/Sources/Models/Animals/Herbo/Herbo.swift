import Foundation

class Herbo: Animal {
    var kindnessLevel: Int
    
    init(food: Int, number: Int, name: String, kindnessLevel: Int) {
        self.kindnessLevel = kindnessLevel
        super.init(food: food, number: number, name: name)
    }
    
    var isContactZooCompatible: Bool {
        return kindnessLevel > 5
    }
} 