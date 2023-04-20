import TCA
import SwiftUI

@main
struct AppMain: App {

  var body: some Scene {
    WindowGroup {
      MainListPage(
        store: .init(
          initialState: MainListStore.State(),
          reducer: MainListStore())
      )
    }
  }
}
