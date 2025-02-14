import Testing
@testable import ZooCore

@Suite("Predator Tests")
final class PredatorTests {
    
    @Test("Predator should be created with correct properties")
    func testPredatorCreation() {
        let predator = Predator(food: 20, number: 1, name: "Test Predator")
        
        #expect(predator.food == 20)
        #expect(predator.number == 1)
        #expect(predator.name == "Test Predator")
    }
} 
