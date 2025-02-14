import SwiftUI
import ZooCore

struct InventoryView: View {
    @ObservedObject var zoo: Zoo
    @State private var showingAddItemSheet = false
    
    private func getItemEmoji(_ item: Thing) -> String {
        if item is ZooCore.Table {
            return "🪑"
        } else if item is Computer {
            return "💻"
        }
        return "📦"
    }
    
    var body: some View {
        NavigationView {
            Group {
                if zoo.inventory.isEmpty {
                    ContentUnavailableView(
                        "Нет инвентаря",
                        systemImage: "folder",
                        description: Text("Добавьте первый предмет")
                    )
                } else {
                    List {
                        ForEach(zoo.inventory, id: \.number) { item in
                            HStack {
                                Text(getItemEmoji(item))
                                    .font(.title2)
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                    if let table = item as? ZooCore.Table {
                                        Text("Тип: \(table.type)")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    } else if let computer = item as? Computer {
                                        Text("Модель: \(computer.model)")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                Spacer()
                                Text("#\(item.number)")
                                    .fontDesign(.monospaced)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Инвентарь")
            .toolbar {
                Button {
                    showingAddItemSheet = true
                } label: {
                    Label("Добавить предмет", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddItemSheet) {
                AddInventoryItemView(zoo: zoo)
            }
        }
    }
} 

#Preview {
    InventoryView(
        zoo: Zoo(veterinaryClinic: VeterinaryClinic())
    )
}

