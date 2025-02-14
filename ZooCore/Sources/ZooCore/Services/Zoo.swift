import Foundation
import SwiftUI

@MainActor
public class Zoo: ObservableObject {

    @Published public private(set) var animals: [Animal] = []
    @Published public private(set) var inventory: [Thing] = []

    public var totalFoodRequired: Int {
        animals.reduce(0) { $0 + $1.food }
    }

    public var contactZooAnimals: [Herbo] {
        animals.compactMap { animal in
            if let herbo = animal as? Herbo, herbo.isContactZooCompatible {
                return herbo
            }
            return nil
        }
    }

    private let veterinaryClinic: VeterinaryService

    public init(veterinaryClinic: VeterinaryService) {
        self.veterinaryClinic = veterinaryClinic
    }

    @discardableResult
    public func addAnimal(_ animal: Animal) -> Bool {
        if veterinaryClinic.examineAnimal(animal) {
            animals.append(animal)
            return true
        }
        return false
    }

    public func addInventoryItem(_ item: Thing) {
        inventory.append(item)
    }
} 
