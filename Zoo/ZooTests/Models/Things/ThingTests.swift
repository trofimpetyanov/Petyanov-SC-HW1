import Testing
@testable import Zoo

@Suite("Thing Tests")
final class ThingTests {
    
    @Test("Thing should be created with correct properties")
    func testThingCreation() {
        let thing = Thing(number: 1, name: "Test Thing")
        
        #expect(thing.number == 1)
        #expect(thing.name == "Test Thing")
    }
    
    @Test("Table should be created with correct properties")
    func testTableCreation() {
        let table = Table(number: 2, name: "Office Table", type: "Desk")
        
        #expect(table.number == 2)
        #expect(table.name == "Office Table")
        #expect(table.type == "Desk")
    }
    
    @Test("Computer should be created with correct properties")
    func testComputerCreation() {
        let computer = Computer(number: 3, name: "Work Station", model: "iMac")
        
        #expect(computer.number == 3)
        #expect(computer.name == "Work Station")
        #expect(computer.model == "iMac")
    }
} 
