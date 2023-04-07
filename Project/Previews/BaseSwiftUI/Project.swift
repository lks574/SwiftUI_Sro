import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .previewProject(
  projectName: "BaseSwiftUI",
  packages: [
    .local(path: "../../Study/BaseSwiftUI"),
  ],
  dependencies: [
    .package(product: "BaseSwiftUI"),
  ])
