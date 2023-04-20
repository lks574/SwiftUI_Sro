// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TCA",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TCA",
            targets: ["TCA"]),
    ],
    dependencies: [
      .package(
        url: "https://github.com/pointfreeco/swift-composable-architecture",
        from: "0.42.0"
      ),
      .package(path: "../../Core/Domain"),
      .package(path: "../../Core/Platform"),
      .package(path: "../../Core/Architecture"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TCA",
            dependencies: [
              .product(
                name: "ComposableArchitecture",
                package: "swift-composable-architecture"
              ),
              "Domain",
              "Platform",
              "Architecture",
            ]),
        .testTarget(
            name: "TCATests",
            dependencies: ["TCA"]),
    ]
)
