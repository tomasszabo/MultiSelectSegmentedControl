// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "MultiSelectSegmentedControl",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "MultiSelectSegmentedControl", targets: ["MultiSelectSegmentedControl"]),
    ],
    dependencies: [
        .package(url: "https://github.com/yonat/SweeterSwift", from: "1.2.6"),
    ],
    targets: [
        .target(name: "MultiSelectSegmentedControl", dependencies: ["SweeterSwift"], path: "Sources",
                swiftSettings: [.defaultIsolation(MainActor.self)]),
        .testTarget(name: "MultiSelectSegmentedControlTests", dependencies: ["MultiSelectSegmentedControl"],
                    path: "PackageTests"),
    ],
    swiftLanguageModes: [.v6]
)
