import Foundation

protocol VeterinaryService {
    func examineAnimal(_ animal: Animal) -> Bool
}

class VeterinaryClinic: VeterinaryService {
    func examineAnimal(_ animal: Animal) -> Bool {
        return animal.checkHealth()
    }
} 