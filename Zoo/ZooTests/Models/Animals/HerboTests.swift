import Testing
@testable import Zoo

@Suite("Herbivorous Animal Tests")
final class HerboTests {
    
    @Test("Herbo should be created with correct properties")
    func testHerboCreation() {
        let herbo = Herbo(food: 5, number: 2, name: "Test Herbo", kindnessLevel: 7)
        
        #expect(herbo.food == 5)
        #expect(herbo.number == 2)
        #expect(herbo.name == "Test Herbo")
        #expect(herbo.kindnessLevel == 7)
    }
    
    @Test("Herbo should be compatible with contact zoo when kindness level > 5")
    func testContactZooCompatibility() {
        let kindHerbo = Herbo(food: 5, number: 2, name: "Kind", kindnessLevel: 8)
        let unkindHerbo = Herbo(food: 5, number: 3, name: "Unkind", kindnessLevel: 3)
        
        #expect(kindHerbo.isContactZooCompatible)
        #expect(!unkindHerbo.isContactZooCompatible)
    }
} 
