import Foundation
import SwiftUI
import Architecture

public struct MainListPage: IntentBindingType {
  @StateObject public var container: Container<MainListIntentType, MainListModel.State>
  public var intent: MainListIntentType { container.intent }
  public var state: MainListModel.State { intent.state }
}

extension MainListPage {
  private var characters: [CharacterItem.ViewState] {
    state.characterRepo?.results.map(CharacterItem.ViewState.init) ?? []
  }
}

extension MainListPage: View {

  public var body: some View {
    VStack(spacing: .zero) {
      ScrollView(.vertical, showsIndicators: false) {
        LazyVStack(spacing: 8) {
          ForEach(characters, id: \.id) { itemState in
            CharacterItem(viewState: itemState)
              .cornerRadius(20)
          }
        }
        .padding(.horizontal, 16)
      }
    }
    .onAppear {
      intent.send(action: .getCharacters)
    }
  }
}

extension MainListPage {
  public static func build(intent: MainListIntent) -> some View {
    MainListPage(container: .init(
      intent: intent as MainListIntentType,
      state: intent.state,
      modelChangePublisher: intent.objectWillChange))
  }
}
