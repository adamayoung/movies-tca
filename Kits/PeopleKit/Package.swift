// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PeopleKit",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .visionOS(.v2)
    ],

    products: [
        .library(name: "PeopleApplication", targets: ["PeopleApplication"]),
        .library(name: "PeopleDomain", targets: ["PeopleDomain"]),
        .library(name: "PeopleInfrastructure", targets: ["PeopleInfrastructure"])
    ],

    dependencies: [
        .package(path: "../../Core/CoreDomain"),
        .package(path: "../../Core/CoreInterfaces"),
        .package(url: "https://github.com/adamayoung/TMDb.git", from: "13.3.0")
    ],

    targets: [
        .target(
            name: "PeopleApplication",
            dependencies: [
                "PeopleDomain",
                "PeopleInfrastructure",
                "CoreDomain",
                "CoreInterfaces",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "PeopleApplicationTests",
            dependencies: ["PeopleApplication"]
        ),

        .target(
            name: "PeopleDomain",
            dependencies: [
                "CoreDomain"
            ]
        ),
        .testTarget(
            name: "PeopleDomainTests",
            dependencies: ["PeopleDomain"]
        ),

        .target(
            name: "PeopleInfrastructure",
            dependencies: [
                "PeopleDomain",
                "CoreInterfaces",
                "TMDb"
            ]
        ),
        .testTarget(
            name: "PeopleInfrastructureTests",
            dependencies: ["PeopleInfrastructure"]
        )
    ]
)
