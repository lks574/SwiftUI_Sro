import MVI
import SwiftUI

@main
struct AppMain: App {

  var body: some Scene {
    WindowGroup {
      MainListPage.build(
        intent: MainListIntent(
          initialState: .init()
        )
      )
    }
  }
}
