import SwiftUI
import ZooCore

struct AddInventoryItemView: View {
    @ObservedObject var zoo: Zoo
    @StateObject private var viewModel = AddInventoryItemViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Название", text: $viewModel.name)
                
                Picker("Тип предмета", selection: $viewModel.itemType) {
                    ForEach(0..<viewModel.itemTypes.count, id: \.self) { index in
                        Text(viewModel.itemTypes[index])
                    }
                }
                
                TextField(viewModel.itemType == 0 ? "Тип стола" : "Модель компьютера", 
                         text: $viewModel.additionalInfo)
            }
            .navigationTitle("Новый предмет")
            .navigationBarItems(
                leading: Button("Отмена") { dismiss() },
                trailing: Button("Добавить") {
                    if let item = viewModel.createItem() {
                        zoo.addInventoryItem(item)
                        dismiss()
                    }
                }
                .disabled(!viewModel.isFormValid)
            )
        }
    }
}

