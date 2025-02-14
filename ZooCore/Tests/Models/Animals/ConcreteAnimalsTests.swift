import Testing
@testable import ZooCore

@Suite("Concrete Animals Tests")
final class ConcreteAnimalsTests {
    
    @Test("Monkey should be created with correct properties")
    func testMonkeyCreation() {
        let monkey = Monkey(food: 5, number: 1, name: "Test Monkey", kindnessLevel: 7)
        
        #expect(monkey.food == 5)
        #expect(monkey.number == 1)
        #expect(monkey.name == "Test Monkey")
        #expect(monkey.kindnessLevel == 7)
        #expect(monkey.isContactZooCompatible)
    }
    
    @Test("Rabbit should be created with correct properties")
    func testRabbitCreation() {
        let rabbit = Rabbit(food: 3, number: 2, name: "Test Rabbit", kindnessLevel: 4)
        
        #expect(rabbit.food == 3)
        #expect(rabbit.number == 2)
        #expect(rabbit.name == "Test Rabbit")
        #expect(rabbit.kindnessLevel == 4)
        #expect(!rabbit.isContactZooCompatible)
    }
    
    @Test("Tiger should be created with correct properties")
    func testTigerCreation() {
        let tiger = Tiger(food: 30, number: 3, name: "Test Tiger")
        
        #expect(tiger.food == 30)
        #expect(tiger.number == 3)
        #expect(tiger.name == "Test Tiger")
    }
    
    @Test("Wolf should be created with correct properties")
    func testWolfCreation() {
        let wolf = Wolf(food: 25, number: 4, name: "Test Wolf")
        
        #expect(wolf.food == 25)
        #expect(wolf.number == 4)
        #expect(wolf.name == "Test Wolf")
    }
} 
