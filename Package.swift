// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-IronSource-iOS-Adapter",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VAMPIronSourceAdapter",
            targets: ["VAMPIronSourceAdapterTarget", "IronSourceSDK"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/VAMP-iOS-SDK",
            "5.3.2"..<"6.0.0"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VAMPIronSourceAdapterTarget",
            dependencies: [
                .target(name: "VAMPIronSourceAdapter"),
                .target(name: "IronSourceSDK"),
                .product(name: "VAMP", package: "VAMP-iOS-SDK"),
            ],
            path: "VAMPIronSourceAdapterTarget"
        ),
        .binaryTarget(
            name: "VAMPIronSourceAdapter",
            url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPIronSourceAdapter-v8.9.1.zip",
            checksum: "f7f8b0197dbae17e2e553bd90dab33c924a8e8868f5c1b6d1776e9bbfea53a00"
        ),
        .binaryTarget(
            name: "IronSourceSDK",
            url: "https://raw.githubusercontent.com/ironsource-mobile/iOS-sdk/master/8.9.1/IronSource8.9.1.zip",
            checksum: "7ce31a68b35e112b22f88a7741c5b7b5da3a7d9f5e4e4e8a03850a5fe2572bbe"
        )
    ]
)