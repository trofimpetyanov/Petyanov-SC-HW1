import Foundation

class Animal: Living, Inventoriable {
    var food: Int
    var number: Int
    var name: String
    
    init(food: Int, number: Int, name: String) {
        self.food = food
        self.number = number
        self.name = name
    }
    
    func checkHealth() -> Bool {
        return true
    }
} 
