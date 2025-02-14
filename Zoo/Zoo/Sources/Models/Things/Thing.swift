import Foundation

class Thing: Inventoriable {
    var number: Int
    let name: String
    
    init(number: Int, name: String) {
        self.number = number
        self.name = name
    }
}
