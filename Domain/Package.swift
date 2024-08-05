// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Entities",
            targets: ["Entities"]
        ),
        .library(
            name: "RepositoryProtocol",
            targets: ["RepositoryProtocol"]
        ),
        .library(
            name: "UseCaseProtocol",
            targets: ["UseCaseProtocol"]
        ),
        .library(
            name: "UseCases",
            targets: ["UseCases"]
        ),
        .library(
            name: "DomainTestUtilities",
            targets: ["DomainTestUtilities"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Entities",
            dependencies: []
        ),
        .target(
            name: "RepositoryProtocol",
            dependencies: ["Entities"]
        ),
        .target(
            name: "UseCaseProtocol",
            dependencies: ["Entities"]
        ),
        .target(
            name: "UseCases",
            dependencies: [
                "Entities",
                "RepositoryProtocol",
                "UseCaseProtocol"
            ]
        ),
        .target(
            name: "DomainTestUtilities",
            dependencies: [
                "Entities",
                "RepositoryProtocol",
                "UseCaseProtocol"
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: [
                "UseCases",
                "RepositoryProtocol",
                "DomainTestUtilities"
            ]
        ),
    ]
)
