import SwiftUI
import ZooCore

struct ContentView: View {
    @StateObject private var zoo: Zoo = DependencyContainer.shared.container.resolve(Zoo.self)!
    
    var body: some View {
        TabView {
            AnimalsView(zoo: zoo)
                .tabItem {
                    Label("Животные", systemImage: "pawprint.fill")
                }
            
            InventoryView(zoo: zoo)
                .tabItem {
                    Label("Инвентарь", systemImage: "folder.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}

