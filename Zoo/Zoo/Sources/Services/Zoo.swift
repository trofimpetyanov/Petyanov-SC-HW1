import Foundation
import SwiftUI

@MainActor
class Zoo: ObservableObject {

    @Published private(set) var animals: [Animal] = []
    @Published private(set) var inventory: [Thing] = []

    var totalFoodRequired: Int {
        animals.reduce(0) { $0 + $1.food }
    }

    var contactZooAnimals: [Herbo] {
        animals.compactMap { animal in
            if let herbo = animal as? Herbo, herbo.isContactZooCompatible {
                return herbo
            }
            return nil
        }
    }

    private let veterinaryClinic: VeterinaryService

    init(veterinaryClinic: VeterinaryService) {
        self.veterinaryClinic = veterinaryClinic
    }

    @discardableResult
    func addAnimal(_ animal: Animal) -> Bool {
        if veterinaryClinic.examineAnimal(animal) {
            animals.append(animal)
            return true
        }
        return false
    }

    func addInventoryItem(_ item: Thing) {
        inventory.append(item)
    }
} 
