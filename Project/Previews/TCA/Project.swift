import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .previewProject(
  projectName: "TCA",
  packages: [
    .local(path: "../../Study/TCA"),
  ],
  dependencies: [
    .package(product: "TCA"),
  ])
