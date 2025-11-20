// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoviesKit",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "MoviesApplication", targets: ["MoviesApplication"]),
        .library(name: "MoviesDomain", targets: ["MoviesDomain"]),
        .library(name: "MoviesInfrastructure", targets: ["MoviesInfrastructure"])
    ],

    dependencies: [
        .package(path: "../../Core/CoreDomain"),
        .package(url: "https://github.com/adamayoung/TMDb.git", from: "13.3.0")
    ],

    targets: [
        .target(
            name: "MoviesApplication",
            dependencies: [
                "MoviesDomain",
                "MoviesInfrastructure",
                "CoreDomain",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "MoviesApplicationTests",
            dependencies: ["MoviesApplication"]
        ),

        .target(
            name: "MoviesDomain",
            dependencies: [
                "CoreDomain"
            ]
        ),
        .testTarget(
            name: "MoviesDomainTests",
            dependencies: ["MoviesDomain"]
        ),

        .target(
            name: "MoviesInfrastructure",
            dependencies: [
                "MoviesDomain",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "MoviesInfrastructureTests",
            dependencies: ["MoviesInfrastructure"]
        )
    ]
)
