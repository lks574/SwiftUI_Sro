import ProjectDescription
import ProjectDescriptionHelpers

let targets: [Target] = [
  .init(
    name: "SwiftUI-Sro",
    platform: .iOS,
    product: .app,
    bundleId: "com.sro.swiftui-sro",
    deploymentTarget: .defaultTarget,
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    scripts: [],
    dependencies: .default,
    settings: .settings()),
]

let project: Project = .init(
  name: "SwiftUI-Sro",
  organizationName: "Sro",
  packages: [
    .local(path: "../Core/Architecture"),
    .local(path: "../Core/Domain"),
    .local(path: "../Core/Platform"),
    .local(path: "../Core/DesignSystem"),
    .local(path: "../Core/Functor"),
    .local(path: "../Study/BaseSwiftUI"),
    .local(path: "../Study/MVI"),
    .local(path: "../Study/TCA"),
  ],
  settings: .settings(),
  targets: targets,
  schemes: [])

extension [TargetDependency] {
  public static var `default`: Self {
    [
      .package(product: "Architecture"),
      .package(product: "Domain"),
      .package(product: "Platform"),
      .package(product: "DesignSystem"),
      .package(product: "Functor"),
      .package(product: "BaseSwiftUI"),
      .package(product: "MVI"),
      .package(product: "TCA"),
    ]
  }
}
