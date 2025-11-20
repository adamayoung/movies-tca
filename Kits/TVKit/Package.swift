// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TVKit",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "TVApplication", targets: ["TVApplication"]),
        .library(name: "TVDomain", targets: ["TVDomain"]),
        .library(name: "TVInfrastructure", targets: ["TVInfrastructure"])
    ],

    dependencies: [
        .package(path: "../../Core/CoreDomain"),
        .package(path: "../../Core/CoreInterfaces"),
        .package(url: "https://github.com/adamayoung/TMDb.git", from: "13.3.0")
    ],

    targets: [
        .target(
            name: "TVApplication",
            dependencies: [
                "TVDomain",
                "TVInfrastructure",
                "CoreDomain",
                "CoreInterfaces",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "TVApplicationTests",
            dependencies: ["TVApplication"]
        ),

        .target(
            name: "TVDomain",
            dependencies: [
                "CoreDomain"
            ]
        ),
        .testTarget(
            name: "TVDomainTests",
            dependencies: ["TVDomain"]
        ),

        .target(
            name: "TVInfrastructure",
            dependencies: [
                "TVDomain",
                "CoreInterfaces",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "TVInfrastructureTests",
            dependencies: ["TVInfrastructure"]
        )
    ]
)
