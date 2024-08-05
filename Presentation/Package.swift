// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presentation",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "BookList",
            targets: ["BookList"]
        ),
        .library(
            name: "BookDetail",
            targets: ["BookDetail"]
        )
    ],
    dependencies: [
        .package(name: "AppStyle", path: "../AppStyle"),
        .package(name: "Domain", path: "../Domain"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BookList",
            dependencies: [
                .product(name: "AppStyle", package: "AppStyle"),
                .product(name: "UseCaseProtocol", package: "Domain"),
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .target(
            name: "BookDetail",
            dependencies: [
                .product(name: "AppStyle", package: "AppStyle"),
                .product(name: "UseCaseProtocol", package: "Domain")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "PresentationTests",
            dependencies: [
                "BookList",
                "BookDetail",
                .product(name: "UseCaseProtocol", package: "Domain"),
            ]),
    ]
)
