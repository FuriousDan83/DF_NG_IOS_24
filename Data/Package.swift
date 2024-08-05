// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "NetworkCore",
            targets: ["NetworkCore"]
        ),
        .library(
            name: "NetworkExtension",
            targets: ["NetworkExtension"]
        ),
        .library(
            name: "Repositories",
            targets: ["Repositories"]
        ),
        .library(
            name: "TestUtilities",
            targets: ["TestUtilities"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(url: "https://github.com/Thieurom/Pilot", from: "0.5.1")
    ],
    targets: [
        .target(
            name: "NetworkCore",
            dependencies: [],
            plugins: []
        ),
        .target(
            name: "NetworkExtension",
            dependencies: [
                "NetworkCore",
                .product(name: "Pilot", package: "Pilot"),
                .product(name: "PilotType", package: "Pilot")
            ]
        ),
        .target(
            name: "Repositories",
            dependencies: [
                "NetworkCore",
                .product(name: "Entities", package: "Domain"),
                .product(name: "RepositoryProtocol:", package: "Domain")
            ]
        ),
        .target(
            name: "TestUtilities",
            dependencies: [
                "NetworkCore",
                "NetworkExtension",
                .product(name: "Entities", package: "Domain")
            ]
        ),
        .testTarget(
            name: "DataTests",
            dependencies: [
                "NetworkCore",
                "Repositories",
                "TestUtilities"
            ]
        ),
    ]
)
