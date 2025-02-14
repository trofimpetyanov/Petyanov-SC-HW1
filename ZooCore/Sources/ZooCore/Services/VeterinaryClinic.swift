import Foundation

public protocol VeterinaryService {
    func examineAnimal(_ animal: Animal) -> Bool
}

public class VeterinaryClinic: VeterinaryService {
    public init() {}
    
    public func examineAnimal(_ animal: Animal) -> Bool {
        return animal.checkHealth()
    }
} 