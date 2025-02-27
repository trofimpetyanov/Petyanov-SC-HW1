# 🦁 Zoo App

This is an iOS application for zoo management, developed using SwiftUI. Instead of a console application, it was decided to create a full-fledged iOS application with a graphical interface for testing convenience. The project was developed as part of the Software Engineering coursework at HSE Faculty of Computer Science.

## 🏗️ Architecture and SOLID Principles

### Single Responsibility Principle (SRP)
- Each class has a clear area of responsibility:
  - `Animal` and its descendants are only responsible for animal behavior
  - `VeterinaryClinic` is only responsible for checking animal health
  - `Zoo` manages the collection of animals and inventory
  - ViewModels are responsible for the business logic of specific screens

### Open/Closed Principle (OCP)
- The system is easily extensible with new types of animals through inheritance from base classes `Animal`, `Predator`, `Herbo`
- Adding new types of inventory is possible through inheritance from `Thing`

### Liskov Substitution Principle (LSP)
- All `Animal` descendants can be used in place of the base class
- All `Thing` descendants can be used in place of the base class

### Interface Segregation Principle (ISP)
- Minimal interfaces are used:
  - `Living` for living creatures (defines food consumption)
  - `Inventoriable` for inventory management

### Dependency Inversion Principle (DIP)
- Dependencies are inverted through protocols:
  - `VeterinaryService` abstracts veterinary clinic operations
- Dependency injection is implemented using the Swinject DI container

## 💉 Dependency Injection

The project uses the Swinject DI container for dependency management. Main registrations:
- `VeterinaryService` - veterinary clinic service
- `Zoo` - main class managing animals and inventory

## ✅ Testing

The project is covered with unit tests using the Testing framework. Tests cover:
- Creation and validation of animals
- Veterinary clinic operations
- Zoo management
- Inventory management
- Dependency Injection

### 📊 Code Coverage Results

![Code Coverage Results](Media/CoverageResults.png)

## ⭐️ Functionality

1. Adding new animals with health checks
2. Viewing list of all animals
3. Calculating total food consumption
4. Determining animals for the petting zoo
5. Inventory management
6. Tracking inventory numbers

## 🎮 Demo

| 🦒 Animal Management | 📋 Inventory Management |
|:----------------:|:-------------------:|
| <img src="Media/Animals.gif" width="180"/> | <img src="Media/Inventory.gif" width="180"/> |

- **Animal Management**: Demonstration of adding various animals and petting zoo operations
- **Inventory Management**: Demonstration of the inventory management system

## 🚀 Project Launch

1. Open the project in Xcode 16 or higher
2. Select iOS 18+ simulator
3. Press Run (⌘ + R)

## 🧪 Running Tests

1. Open `ZooCore/Package.swift` in Xcode
2. Wait for project indexing
3. Press Test (⌘ + U) or select any test file and run tests using the ▶️ button 
