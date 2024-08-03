// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppStyle",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppStyle",
            targets: ["AppStyle"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.2")
    ],
    targets: [
        .target(
            name: "AppStyle",
            dependencies: [],
            resources: [
                .process("Resources")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "AppStyleTests",
            dependencies: ["AppStyle"]),
    ]
)
