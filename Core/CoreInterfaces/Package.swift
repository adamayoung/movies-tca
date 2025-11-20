// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreInterfaces",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "CoreInterfaces", targets: ["CoreInterfaces"])
    ],

    dependencies: [
        .package(path: "../CoreDomain")
    ],

    targets: [
        .target(
            name: "CoreInterfaces",
            dependencies: [
                "CoreDomain"
            ]
        )
    ]
)
