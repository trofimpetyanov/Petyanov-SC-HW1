import Foundation

public class Thing: Inventoriable {
    public var number: Int
    public let name: String
    
    public init(number: Int, name: String) {
        self.number = number
        self.name = name
    }
}
