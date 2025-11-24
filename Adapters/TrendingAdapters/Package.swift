// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TrendingAdapters",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "TrendingAdapters", targets: ["TrendingAdapters"])
    ],

    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.23.1"),
        .package(path: "../../Kits/TrendingKit"),
        .package(path: "../../Kits/MoviesKit"),
        .package(path: "../../Kits/TVKit"),
        .package(path: "../../Kits/ConfigurationKit"),
        .package(path: "../../Core/CoreDomain"),
        .package(path: "../../TMDbAdapters")
    ],

    targets: [
        .target(
            name: "TrendingAdapters",
            dependencies: [
                .product(name: "TrendingApplication", package: "TrendingKit"),
                .product(name: "TrendingDomain", package: "TrendingKit"),
                .product(name: "MoviesApplication", package: "MoviesKit"),
                .product(name: "MoviesDomain", package: "MoviesKit"),
                .product(name: "TVApplication", package: "TVKit"),
                .product(name: "TVDomain", package: "TVKit"),
                .product(name: "ConfigurationApplication", package: "ConfigurationKit"),
                "CoreDomain",
                "TMDbAdapters",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        )
    ]
)
