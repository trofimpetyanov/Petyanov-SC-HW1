import Testing
@testable import ZooCore

@Suite("Veterinary Clinic Tests")
final class VeterinaryClinicTests {
    
    @Test("Veterinary clinic should examine animals")
    func testAnimalExamination() throws {
        let clinic = VeterinaryClinic()
        let animal = Animal(food: 10, number: 1, name: "Test Animal")

        for _ in 1...100 {
            let result = clinic.examineAnimal(animal)
            #expect(result == true)
        }
    }
} 
