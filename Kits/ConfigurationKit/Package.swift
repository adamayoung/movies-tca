// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConfigurationKit",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "ConfigurationApplication", targets: ["ConfigurationApplication"]),
        .library(name: "ConfigurationDomain", targets: ["ConfigurationDomain"]),
        .library(name: "ConfigurationInfrastructure", targets: ["ConfigurationInfrastructure"])
    ],

    dependencies: [
        .package(path: "../../Core/CoreDomain"),
        .package(path: "../../Core/CoreInterfaces"),
        .package(url: "https://github.com/adamayoung/TMDb.git", from: "13.3.0")
    ],

    targets: [
        .target(
            name: "ConfigurationApplication",
            dependencies: [
                "ConfigurationDomain",
                "ConfigurationInfrastructure",
                "CoreDomain",
                "CoreInterfaces",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "ConfigurationApplicationTests",
            dependencies: ["ConfigurationApplication"]
        ),

        .target(
            name: "ConfigurationDomain",
            dependencies: [
                "CoreDomain"
            ]
        ),
        .testTarget(
            name: "ConfigurationDomainTests",
            dependencies: ["ConfigurationDomain"]
        ),

        .target(
            name: "ConfigurationInfrastructure",
            dependencies: [
                "ConfigurationDomain",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "ConfigurationInfrastructureTests",
            dependencies: ["ConfigurationInfrastructure"]
        )
    ]

)
