import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .previewProject(
  projectName: "MVI",
  packages: [
    .local(path: "../../Study/MVI"),
  ],
  dependencies: [
    .package(product: "MVI"),
  ])
