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
            targets: ["VAMPIronSourceAdapterTarget"]),
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
            url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPIronSourceAdapter-v8.11.0.zip",
            checksum: "2b5295387a9ad98d5cc19bd5be5379773ed5ea75680ed4a93e54c5ff911dc75b"
        ),
        .binaryTarget(
            name: "IronSourceSDK",
            url: "https://raw.githubusercontent.com/ironsource-mobile/iOS-sdk/master/8.11.0/IronSource8.11.0.zip",
            checksum: "d37214e549807530aefb740c2330b611332090eb2f5faf4c107338bddb72b00d"
        )
    ]
)