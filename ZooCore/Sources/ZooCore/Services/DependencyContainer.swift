import Foundation
import Swinject

@MainActor
public class DependencyContainer {
    public static let shared = DependencyContainer()
    public let container = Container()
    
    private init() {
        registerServices()
    }
    
    private func registerServices() {
        container.register(VeterinaryService.self) { _ in
            VeterinaryClinic()
        }.inObjectScope(.container)

        container.register(Zoo.self) { resolver in
            let clinic = resolver.resolve(VeterinaryService.self) ?? VeterinaryClinic()
            return Zoo(veterinaryClinic: clinic)
        }.inObjectScope(.container)
    }
} 
