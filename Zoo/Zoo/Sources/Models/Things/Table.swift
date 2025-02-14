import Foundation

class Table: Thing {
    let type: String
    
    init(number: Int, name: String, type: String) {
        self.type = type
        super.init(number: number, name: name)
    }
}
