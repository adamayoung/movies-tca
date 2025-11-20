// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TrendingKit",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "TrendingApplication", targets: ["TrendingApplication"]),
        .library(name: "TrendingDomain", targets: ["TrendingDomain"]),
        .library(name: "TrendingInfrastructure", targets: ["TrendingInfrastructure"])
    ],

    dependencies: [
        .package(path: "../../Core/CoreDomain"),
        .package(url: "https://github.com/adamayoung/TMDb.git", from: "13.3.0")
    ],

    targets: [
        .target(
            name: "TrendingApplication",
            dependencies: [
                "TrendingDomain",
                "TrendingInfrastructure",
                "CoreDomain",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "TrendingApplicationTests",
            dependencies: ["TrendingApplication"]
        ),

        .target(
            name: "TrendingDomain",
            dependencies: [
                "CoreDomain"
            ]
        ),
        .testTarget(
            name: "TrendingDomainTests",
            dependencies: ["TrendingDomain"]
        ),

        .target(
            name: "TrendingInfrastructure",
            dependencies: [
                "TrendingDomain",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "TrendingInfrastructureTests",
            dependencies: ["TrendingInfrastructure"]
        )
    ]
)
