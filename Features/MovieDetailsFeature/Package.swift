// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MovieDetailsFeature",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "MovieDetailsFeature", targets: ["MovieDetailsFeature"])
    ],

    dependencies: [
        .package(path: "../../Core/DesignSystem"),
        .package(path: "../../Kits/MoviesKit"),
        .package(path: "../../Adapters/MoviesAdapters"),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.23.1")
    ],

    targets: [
        .target(
            name: "MovieDetailsFeature",
            dependencies: [
                "DesignSystem",
                .product(name: "MoviesApplication", package: "MoviesKit"),
                "MoviesAdapters",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "MovieDetailsFeatureTests",
            dependencies: ["MovieDetailsFeature"]
        )
    ]
)
