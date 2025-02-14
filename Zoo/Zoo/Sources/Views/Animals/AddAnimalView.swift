import SwiftUI
import ZooCore

struct AddAnimalView: View {
    @ObservedObject var zoo: Zoo
    @StateObject private var viewModel = AddAnimalViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Имя животного", text: $viewModel.name)
                TextField("Потребление еды (кг)", text: $viewModel.food)
                    .keyboardType(.numberPad)
                
                Picker("Тип животного", selection: $viewModel.animalType) {
                    ForEach(0..<viewModel.animalTypes.count, id: \.self) { index in
                        Text(viewModel.animalTypes[index])
                    }
                }
                
                if viewModel.animalType < 2 {
                    Stepper("Уровень доброты: \(viewModel.kindnessLevel)", 
                           value: $viewModel.kindnessLevel, in: 1...10)
                }
            }
            .navigationTitle("Новое животное")
            .navigationBarItems(
                leading: Button("Отмена") { dismiss() },
                trailing: Button("Добавить") {
                    if let animal = viewModel.createAnimal() {
                        zoo.addAnimal(animal)
                        dismiss()
                    }
                }
                .disabled(!viewModel.isFormValid)
            )
        }
    }
} 

