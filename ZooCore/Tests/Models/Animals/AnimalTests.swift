import Testing
@testable import ZooCore

@Suite("Animal Tests")
final class AnimalTests {
    
    @Test("Animal should be created with correct properties")
    func testAnimalCreation() {
        let animal = Animal(food: 10, number: 1, name: "Test Animal")
        
        #expect(animal.food == 10)
        #expect(animal.number == 1)
        #expect(animal.name == "Test Animal")
    }
} 
