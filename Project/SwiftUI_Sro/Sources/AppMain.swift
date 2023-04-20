import SwiftUI
import BaseSwiftUI
import MVI
import TCA

@main
struct AppMain: App {

  var body: some Scene {
    WindowGroup {
      NavigationView {
        VStack(alignment: .leading, spacing: 8) {
          NavigationLink("BaseSwiftUI") {
            MainListPage()
          }

          NavigationLink("MVI") {
            MainListPage.build(
              intent: MainListIntent(
                initialState: .init()
              )
            )
          }

          NavigationLink("TCA") {
            MainListPage(
              store: .init(
                initialState: MainListStore.State(),
                reducer: MainListStore())
            )
          }
        }
      }
    }
  }
}
