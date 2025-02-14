import Testing
@testable import ZooCore

@Suite("Zoo Management Tests")
@MainActor
final class ZooTests {
    
    @Test("Zoo should add healthy animals")
    func testAddHealthyAnimal() throws {
        let clinic = MockVeterinaryClinic(shouldAcceptAnimal: true)
        let zoo = Zoo(veterinaryClinic: clinic)
        let animal = Animal(food: 10, number: 1, name: "Test Animal")
        
        let result = zoo.addAnimal(animal)
        
        #expect(result)
        #expect(zoo.animals.count == 1)
        #expect(zoo.animals.first?.name == "Test Animal")
    }
    
    @Test("Zoo should reject unhealthy animals")
    func testRejectUnhealthyAnimal() throws {
        let clinic = MockVeterinaryClinic(shouldAcceptAnimal: false)
        let zoo = Zoo(veterinaryClinic: clinic)
        let animal = Animal(food: 10, number: 1, name: "Test Animal")
        
        let result = zoo.addAnimal(animal)
        
        #expect(!result)
        #expect(zoo.animals.isEmpty)
    }
    
    @Test("Zoo should correctly calculate total food required")
    func testTotalFoodCalculation() throws {
        let clinic = MockVeterinaryClinic(shouldAcceptAnimal: true)
        let zoo = Zoo(veterinaryClinic: clinic)
        
        let animal1 = Animal(food: 10, number: 1, name: "Animal 1")
        let animal2 = Animal(food: 15, number: 2, name: "Animal 2")
        
        zoo.addAnimal(animal1)
        zoo.addAnimal(animal2)
        
        #expect(zoo.totalFoodRequired == 25)
    }
    
    @Test("Zoo should correctly identify contact zoo compatible animals")
    func testContactZooAnimals() throws {
        let clinic = MockVeterinaryClinic(shouldAcceptAnimal: true)
        let zoo = Zoo(veterinaryClinic: clinic)
        
        let kindHerbo = Herbo(food: 5, number: 1, name: "Kind", kindnessLevel: 8)
        let unkindHerbo = Herbo(food: 5, number: 2, name: "Unkind", kindnessLevel: 3)
        let predator = Predator(food: 20, number: 3, name: "Predator")
        
        zoo.addAnimal(kindHerbo)
        zoo.addAnimal(unkindHerbo)
        zoo.addAnimal(predator)
        
        #expect(zoo.contactZooAnimals.count == 1)
        #expect(zoo.contactZooAnimals.first?.name == "Kind")
    }
    
    @Test("Zoo should handle empty state")
    func testEmptyZoo() throws {
        let clinic = MockVeterinaryClinic(shouldAcceptAnimal: true)
        let zoo = Zoo(veterinaryClinic: clinic)
        
        #expect(zoo.animals.isEmpty)
        #expect(zoo.totalFoodRequired == 0)
        #expect(zoo.contactZooAnimals.isEmpty)
    }
    
    @Test("Zoo should handle multiple animals addition")
    func testMultipleAnimalsAddition() throws {
        let clinic = MockVeterinaryClinic(shouldAcceptAnimal: true)
        let zoo = Zoo(veterinaryClinic: clinic)
        
        let monkey = Monkey(food: 5, number: 1, name: "Monkey", kindnessLevel: 8)
        let tiger = Tiger(food: 30, number: 2, name: "Tiger")
        let rabbit = Rabbit(food: 3, number: 3, name: "Rabbit", kindnessLevel: 6)
        let wolf = Wolf(food: 25, number: 4, name: "Wolf")
        
        zoo.addAnimal(monkey)
        zoo.addAnimal(tiger)
        zoo.addAnimal(rabbit)
        zoo.addAnimal(wolf)
        
        #expect(zoo.animals.count == 4)
        #expect(zoo.totalFoodRequired == 63)
        #expect(zoo.contactZooAnimals.count == 2)
    }
    
    @Test("Zoo should handle inventory items")
    func testInventoryManagement() {
        let zoo = Zoo(veterinaryClinic: VeterinaryClinic())
        
        let table = Table(number: 1, name: "Office Table", type: "Desk")
        let computer = Computer(number: 2, name: "iMac", model: "M1")
        
        zoo.addInventoryItem(table)
        zoo.addInventoryItem(computer)
        
        #expect(zoo.inventory.count == 2)
        #expect(zoo.inventory[0] as? Table != nil)
        #expect(zoo.inventory[1] as? Computer != nil)
        
        if let tableItem = zoo.inventory[0] as? Table {
            #expect(tableItem.name == "Office Table")
            #expect(tableItem.type == "Desk")
            #expect(tableItem.number == 1)
        }
        
        if let computerItem = zoo.inventory[1] as? Computer {
            #expect(computerItem.name == "iMac")
            #expect(computerItem.model == "M1")
            #expect(computerItem.number == 2)
        }
    }
    
    @Test("Zoo should handle mixed animals and inventory")
    func testMixedItemsManagement() {
        let clinic = MockVeterinaryClinic(shouldAcceptAnimal: true)
        let zoo = Zoo(veterinaryClinic: clinic)
        
        let animal = Animal(food: 10, number: 1, name: "Test Animal")
        let table = Table(number: 2, name: "Test Table", type: "Test")
        
        zoo.addAnimal(animal)
        zoo.addInventoryItem(table)
        
        #expect(zoo.animals.count == 1)
        #expect(zoo.inventory.count == 1)
        #expect(zoo.animals[0].number == 1)
        #expect(zoo.inventory[0].number == 2)
    }
}

private class MockVeterinaryClinic: VeterinaryService {
    let shouldAcceptAnimal: Bool
    
    init(shouldAcceptAnimal: Bool) {
        self.shouldAcceptAnimal = shouldAcceptAnimal
    }
    
    func examineAnimal(_ animal: Animal) -> Bool {
        return shouldAcceptAnimal
    }
}
