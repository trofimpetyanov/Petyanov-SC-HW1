import Testing
@testable import Zoo

@Suite("Add Animal View Model Tests")
final class AddAnimalViewModelTests {
    
    @Test("Form validation should work correctly")
    func testFormValidation() {
        let viewModel = AddAnimalViewModel()
        
        // Initially form should be invalid
        #expect(!viewModel.isFormValid)
        
        // Invalid cases
        viewModel.name = "Test"
        viewModel.food = ""
        #expect(!viewModel.isFormValid)
        
        viewModel.name = ""
        viewModel.food = "10"
        #expect(!viewModel.isFormValid)
        
        viewModel.name = "Test"
        viewModel.food = "invalid"
        #expect(!viewModel.isFormValid)
        
        viewModel.name = "Test"
        viewModel.food = "-5"
        #expect(!viewModel.isFormValid)
        
        // Valid case
        viewModel.name = "Test"
        viewModel.food = "10"
        #expect(viewModel.isFormValid)
    }
    
    @Test("Should create Monkey correctly")
    func testCreateMonkey() {
        let viewModel = AddAnimalViewModel()
        viewModel.name = "Test Monkey"
        viewModel.food = "5"
        viewModel.animalType = 0
        viewModel.kindnessLevel = 8
        
        let animal = viewModel.createAnimal()
        
        #expect(animal is Monkey)
        if let monkey = animal as? Monkey {
            #expect(monkey.name == "Test Monkey")
            #expect(monkey.food == 5)
            #expect(monkey.kindnessLevel == 8)
        }
    }
    
    @Test("Should create Tiger correctly")
    func testCreateTiger() {
        let viewModel = AddAnimalViewModel()
        viewModel.name = "Test Tiger"
        viewModel.food = "30"
        viewModel.animalType = 2
        
        let animal = viewModel.createAnimal()
        
        #expect(animal is Tiger)
        if let tiger = animal as? Tiger {
            #expect(tiger.name == "Test Tiger")
            #expect(tiger.food == 30)
        }
    }
    
    @Test("Should handle invalid food input")
    func testInvalidFoodInput() {
        let viewModel = AddAnimalViewModel()
        viewModel.name = "Test"
        viewModel.food = "invalid"
        
        let animal = viewModel.createAnimal()
        #expect(animal == nil)
    }
    
    @Test("Should handle invalid animal type")
    func testInvalidAnimalType() {
        let viewModel = AddAnimalViewModel()
        viewModel.name = "Test"
        viewModel.food = "10"
        viewModel.animalType = 999
        
        let animal = viewModel.createAnimal()
        #expect(animal == nil)
    }
    
    @Test("Should create all animal types correctly")
    func testCreateAllAnimalTypes() {
        let viewModel = AddAnimalViewModel()
        viewModel.name = "Test"
        viewModel.food = "10"
        
        // Test Monkey
        viewModel.animalType = 0
        viewModel.kindnessLevel = 8
        var animal = viewModel.createAnimal()
        #expect(animal is Monkey)
        
        // Test Rabbit
        viewModel.animalType = 1
        viewModel.kindnessLevel = 4
        animal = viewModel.createAnimal()
        #expect(animal is Rabbit)
        
        // Test Tiger
        viewModel.animalType = 2
        animal = viewModel.createAnimal()
        #expect(animal is Tiger)
        
        // Test Wolf
        viewModel.animalType = 3
        animal = viewModel.createAnimal()
        #expect(animal is Wolf)
    }
    
    @Test("Should initialize with default values")
    func testInitialValues() {
        let viewModel = AddAnimalViewModel()
        
        #expect(viewModel.name.isEmpty)
        #expect(viewModel.food.isEmpty)
        #expect(viewModel.animalType == 0)
        #expect(viewModel.kindnessLevel == 5)
        #expect(viewModel.animalTypes.count == 4)
    }
} 