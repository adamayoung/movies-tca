// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConfigurationAdapters",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "ConfigurationAdapters", targets: ["ConfigurationAdapters"])
    ],

    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.23.1"),
        .package(path: "../../Kits/ConfigurationKit"),
        .package(path: "../../TMDbAdapters")
    ],

    targets: [
        .target(
            name: "ConfigurationAdapters",
            dependencies: [
                .product(name: "ConfigurationApplication", package: "ConfigurationKit"),
                "TMDbAdapters",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        )
    ]
)
