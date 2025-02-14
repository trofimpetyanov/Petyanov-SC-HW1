import Testing
import Swinject
@testable import ZooCore

@Suite("Dependency Container Tests")
@MainActor
final class DependencyContainerTests {
    
    @Test("Container should register and resolve VeterinaryService")
    func testVeterinaryServiceRegistration() throws {
        let container = DependencyContainer.shared
        
        let service = container.container.resolve(VeterinaryService.self)
        
        #expect(service != nil)
        #expect(service is VeterinaryClinic)
    }
    
    @Test("Container should register and resolve Zoo")
    func testZooRegistration() throws {
        let container = DependencyContainer.shared
        
        let zoo = container.container.resolve(Zoo.self)
        
        #expect(zoo != nil)
    }
    
    @Test("Container should reuse the same Zoo instance (Singleton)")
    func testZooSingleton() throws {
        let container = DependencyContainer.shared
        
        let zoo1 = container.container.resolve(Zoo.self)
        let zoo2 = container.container.resolve(Zoo.self)
        
        #expect(zoo1 === zoo2)
    }
    
    @Test("Zoo should be initialized with VeterinaryService")
    func testZooDependencyInjection() throws {
        let container = DependencyContainer.shared

        let zoo = container.container.resolve(Zoo.self)

        let animal = Animal(food: 10, number: 1, name: "Test Animal")
        let result = zoo?.addAnimal(animal)
        
        #expect(result == true)
    }
    
    @Test("Container should handle multiple resolutions")
    func testMultipleResolutions() throws {
        let container = DependencyContainer.shared
        
        for _ in 1...5 {
            let zoo = container.container.resolve(Zoo.self)
            let service = container.container.resolve(VeterinaryService.self)
            
            #expect(zoo != nil)
            #expect(service != nil)
        }
    }
} 
