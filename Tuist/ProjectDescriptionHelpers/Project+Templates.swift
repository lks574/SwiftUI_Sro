import ProjectDescription

extension Target {
  static func previewTarget(
    projectName: String,
    dependencies: [TargetDependency])
    -> Self
  {
    .init(
      name: "\(projectName)Preview",
      platform: .iOS,
      product: .app,
      bundleId: "com.sro.swiftui-sro.\(projectName.lowercased()).preview",
      deploymentTarget: .defaultTarget,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      scripts: [],
      dependencies: dependencies,
      settings: .settings())
  }

  static func previewTestTarget(
    projectName: String)
    -> Self
  {
    .init(
      name: "\(projectName)PreviewTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "com.sro.swiftui-sro.\(projectName.lowercased()).preview.tests",
      deploymentTarget: .defaultTarget,
      sources: ["Tests/**"],
      dependencies: [
        .target(name: "\(projectName)Preview"),
      ],
      settings: .settings())
  }
}

extension [Scheme] {
  public static func testScheme(previewTestTarget: String) -> Self {
    [
      .init(
        name: "\(previewTestTarget)Preview",
        shared: true,
        hidden: false,
        buildAction: .init(targets: ["\(previewTestTarget)Preview"]),
        testAction: .targets(["\(previewTestTarget)PreviewTests"])),
    ]
  }
}

extension Project {
  public static func previewProject(
    projectName: String,
    packages: [Package],
    dependencies: [TargetDependency])
    -> Self
  {
    .init(
      name: "\(projectName)Preview",
      organizationName: "Sro",
      packages: packages,
      targets: [
        .previewTarget(projectName: projectName, dependencies: dependencies),
        .previewTestTarget(projectName: projectName),
      ],
      schemes: .testScheme(previewTestTarget: projectName))
  }
}
