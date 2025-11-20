// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TVAdapters",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "TVAdapters", targets: ["TVAdapters"])
    ],

    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.23.1"),
        .package(path: "../../Kits/TVKit"),
        .package(path: "../../Kits/ConfigurationKit"),
        .package(path: "../../TMDbAdapters")
    ],

    targets: [
        .target(
            name: "TVAdapters",
            dependencies: [
                .product(name: "TVApplication", package: "TVKit"),
                .product(name: "ConfigurationApplication", package: "ConfigurationKit"),
                "TMDbAdapters",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        )
    ]
)
