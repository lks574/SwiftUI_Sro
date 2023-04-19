import Foundation
import SwiftUI
import Platform
import Domain

public struct MainListPage: View {

  @State private var characterRepo: CharactersRepo?
  @State private var errorRepo: ErrorRepo?
  @State private var isShowAlert: Bool = false

  private var characters: [CharacterItem.ViewState] {
    characterRepo?.results.map(CharacterItem.ViewState.init) ?? []
  }

  public init() { }

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
    .task {
      let getCharacter = await RickAndMortyUseCasePlatform().getCharacters()
      switch getCharacter {
      case .success(let result):
        characterRepo = result
      case .failure(let error):
        errorRepo = error
        isShowAlert = true
      }
    }
    .alert(errorRepo?.displayMessage ?? "", isPresented: $isShowAlert) {
      Button("OK", role: .cancel) { }
    }
  }
}
