import Foundation

class AddAnimalViewModel: ObservableObject {
    @Published var name = ""
    @Published var food = ""
    @Published var animalType = 0
    @Published var kindnessLevel = 5
    
    let animalTypes = ["Обезьяна", "Кролик", "Тигр", "Волк"]
    
    var isFormValid: Bool {
        !name.isEmpty && 
        !food.isEmpty && 
        Int(food) != nil && 
        Int(food)! > 0
    }
    
    func createAnimal() -> Animal? {
        guard let foodInt = Int(food) else { return nil }
        let number = Int.random(in: 1000...9999)
        
        switch animalType {
        case 0:
            return Monkey(food: foodInt, number: number, name: name, kindnessLevel: kindnessLevel)
        case 1:
            return Rabbit(food: foodInt, number: number, name: name, kindnessLevel: kindnessLevel)
        case 2:
            return Tiger(food: foodInt, number: number, name: name)
        case 3:
            return Wolf(food: foodInt, number: number, name: name)
        default:
            return nil
        }
    }
} 
