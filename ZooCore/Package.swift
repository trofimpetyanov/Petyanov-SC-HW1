// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "ZooCore",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "ZooCore",
            targets: ["ZooCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.0")
    ],
    targets: [
        .target(
            name: "ZooCore",
            dependencies: ["Swinject"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]),
        .testTarget(
            name: "ZooCoreTests",
            dependencies: ["ZooCore"])
    ]
) 
