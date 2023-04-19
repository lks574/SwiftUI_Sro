import Foundation
import Architecture
import Combine
import Domain
import Platform

public protocol MainListIntentType {
  var state: MainListModel.State { get }

  func send(action: MainListModel.ViewAction)
}

public final class MainListIntent: ObservableObject {

  public init(initialState: State) {
    state = initialState
  }

  public typealias State = MainListModel.State
  public typealias ViewAction = MainListModel.ViewAction

  @Published public var state: State = .init()
  public var cancellable: Set<AnyCancellable> = []
}

extension MainListIntent: IntentType, MainListIntentType {

  public func mutate(action: MainListModel.ViewAction) {
    switch action {
    case .getCharacters:
      Task {
        let getCharacter = await RickAndMortyUseCasePlatform().getCharacters()
        switch getCharacter {
        case .success(let result):
          state.characterRepo = result
        case .failure(let error):
          state.errorRepo = error
          state.isShowAlert = true
        }
      }
    }
  }
}
