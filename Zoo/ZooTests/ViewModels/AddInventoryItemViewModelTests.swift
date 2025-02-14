import Testing
@testable import Zoo

@Suite("Add Inventory Item View Model Tests")
final class AddInventoryItemViewModelTests {
    
    @Test("Form validation should work correctly")
    func testFormValidation() {
        let viewModel = AddInventoryItemViewModel()
        
        // Initially form should be invalid
        #expect(!viewModel.isFormValid)
        
        // Invalid cases
        viewModel.name = "Test"
        viewModel.additionalInfo = ""
        #expect(!viewModel.isFormValid)
        
        viewModel.name = ""
        viewModel.additionalInfo = "Info"
        #expect(!viewModel.isFormValid)
        
        // Valid case
        viewModel.name = "Test"
        viewModel.additionalInfo = "Info"
        #expect(viewModel.isFormValid)
    }
    
    @Test("Should create Table correctly")
    func testCreateTable() {
        let viewModel = AddInventoryItemViewModel()
        viewModel.name = "Test Table"
        viewModel.itemType = 0
        viewModel.additionalInfo = "Office"
        
        let item = viewModel.createItem()
        
        #expect(item is Table)
        if let table = item as? Table {
            #expect(table.name == "Test Table")
            #expect(table.type == "Office")
        }
    }
    
    @Test("Should create Computer correctly")
    func testCreateComputer() {
        let viewModel = AddInventoryItemViewModel()
        viewModel.name = "Test Computer"
        viewModel.itemType = 1
        viewModel.additionalInfo = "M1"
        
        let item = viewModel.createItem()
        
        #expect(item is Computer)
        if let computer = item as? Computer {
            #expect(computer.name == "Test Computer")
            #expect(computer.model == "M1")
        }
    }
    
    @Test("Should handle invalid item type")
    func testInvalidItemType() {
        let viewModel = AddInventoryItemViewModel()
        viewModel.name = "Test"
        viewModel.itemType = 999
        viewModel.additionalInfo = "Info"
        
        let item = viewModel.createItem()
        #expect(item == nil)
    }
} 