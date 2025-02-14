import Foundation

class Computer: Thing {
    let model: String
    
    init(number: Int, name: String, model: String) {
        self.model = model
        super.init(number: number, name: name)
    }
} 
