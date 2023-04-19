// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MVI",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MVI",
            targets: ["MVI"]),
    ],
    dependencies: [
      .package(path: "../../Core/Domain"),
      .package(path: "../../Core/Platform"),
      .package(path: "../../Core/Architecture"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MVI",
            dependencies: [
              "Domain",
              "Platform",
              "Architecture",
            ]),
        .testTarget(
            name: "MVITests",
            dependencies: ["MVI"]),
    ]
)
