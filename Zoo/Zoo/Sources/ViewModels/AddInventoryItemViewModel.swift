import Foundation

class AddInventoryItemViewModel: ObservableObject {
    @Published var name = ""
    @Published var itemType = 0
    @Published var additionalInfo = ""
    
    let itemTypes = ["Стол", "Компьютер"]
    
    var isFormValid: Bool {
        !name.isEmpty && !additionalInfo.isEmpty
    }
    
    func createItem() -> Thing? {
        let number = Int.random(in: 1000...9999)
        
        switch itemType {
        case 0:
            return Table(number: number, name: name, type: additionalInfo)
        case 1:
            return Computer(number: number, name: name, model: additionalInfo)
        default:
            return nil
        }
    }
} 