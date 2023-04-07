import ProjectDescription

extension Target {
  static func previewTarget(
    projectName: String,
    dependencies: [TargetDependency]
  ) -> Self
  {
    .init(
      name: "SwiftUI-Sro",
      platform: .iOS,
      product: .app,
      bundleId: "com.sro.swiftui-Sro.\(projectName.lowercased()).preview",
      deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      scripts: [],
      dependencies: dependencies,
      settings: .settings()
    )
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
        testAction: .targets(["\(previewTestTarget)PreviewTests"])
      ),
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
      ],
      schemes: .testScheme(previewTestTarget: projectName)
    )
  }
}
