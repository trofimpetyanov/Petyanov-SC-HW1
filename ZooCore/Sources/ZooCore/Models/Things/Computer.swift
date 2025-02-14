import Foundation

public class Computer: Thing {
    public let model: String
    
    public init(number: Int, name: String, model: String) {
        self.model = model
        super.init(number: number, name: name)
    }
} 
