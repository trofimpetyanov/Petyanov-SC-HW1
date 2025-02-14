import SwiftUI

struct AnimalsView: View {
    @ObservedObject var zoo: Zoo
    @State private var showingAddAnimalSheet = false
    
    var body: some View {
        NavigationView {
            Group {
                if zoo.animals.isEmpty {
                    ContentUnavailableView(
                        "Нет животных",
                        systemImage: "pawprint",
                        description: Text("Добавьте первое животное")
                    )
                } else {
                    List {
                        Section(header: Text("Статистика")) {
                            Text("Всего еды требуется: \(zoo.totalFoodRequired) кг")
                            Text("Всего животных: \(zoo.animals.count)")
                        }
                        
                        if !zoo.contactZooAnimals.isEmpty {
                            Section(header: Text("Животные для контактного зоопарка")) {
                                ForEach(zoo.contactZooAnimals, id: \.number) { animal in
                                    HStack {
                                        Text(getAnimalEmoji(animal))
                                            .font(.title2)
                                        HStack {
                                            Text(animal.name)
                                            KindnessBadgeView(level: animal.kindnessLevel)
                                        }
                                        Spacer()
                                        Text("#\(animal.number)")
                                            .fontDesign(.monospaced)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        
                        if !zoo.animals.isEmpty {
                            Section(header: Text("Все животные")) {
                                ForEach(zoo.animals, id: \.number) { animal in
                                    HStack {
                                        Text(getAnimalEmoji(animal))
                                            .font(.title2)
                                        if let herbo = animal as? Herbo {
                                            HStack {
                                                Text(animal.name)
                                                KindnessBadgeView(level: herbo.kindnessLevel)
                                            }
                                        } else {
                                            Text(animal.name)
                                        }
                                        Spacer()
                                        Text("#\(animal.number)")
                                            .fontDesign(.monospaced)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Животные")
            .toolbar {
                Button {
                    showingAddAnimalSheet = true
                } label: {
                    Label("Добавить животное", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddAnimalSheet) {
                AddAnimalView(zoo: zoo)
            }
        }
    }

    private func getAnimalEmoji(_ animal: Animal) -> String {
        if animal is Monkey {
            return "🐒"
        } else if animal is Rabbit {
            return "🐰"
        } else if animal is Tiger {
            return "🐯"
        } else if animal is Wolf {
            return "🐺"
        }
        return "🦊"
    }
}

#Preview {
    AnimalsView(zoo: Zoo(veterinaryClinic: VeterinaryClinic()))
}

