import Foundation

public class Table: Thing {
    public let type: String
    
    public init(number: Int, name: String, type: String) {
        self.type = type
        super.init(number: number, name: name)
    }
}
