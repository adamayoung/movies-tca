// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDomain",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "CoreDomain", targets: ["CoreDomain"])
    ],

    targets: [
        .target(name: "CoreDomain"),
        .testTarget(
            name: "CoreDomainTests",
            dependencies: ["CoreDomain"]
        )
    ]
)
