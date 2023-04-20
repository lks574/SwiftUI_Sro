import ComposableArchitecture
import SwiftUI

public struct MainListPage {
  private let store: StoreOf<MainListStore>
  @ObservedObject private var viewStore: ViewStoreOf<MainListStore>

  public init(store: StoreOf<MainListStore>) {
    self.store = store
    viewStore = ViewStore(store)
  }
}

extension MainListPage {
  private var characters: [CharacterItem.ViewState] {
    viewStore.state.characterRepo?.results.map(CharacterItem.ViewState.init) ?? []
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
      viewStore.send(.getCharacters)
    }
    .alert(viewStore.state.errorRepo?.displayMessage ?? "", isPresented: viewStore.binding(\.$isShowAlert)) {
      Button("OK", role: .cancel) { }
    }
  }
}
