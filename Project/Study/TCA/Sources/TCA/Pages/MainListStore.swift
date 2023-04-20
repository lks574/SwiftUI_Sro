import Foundation
import ComposableArchitecture
import Domain
import Platform

public struct MainListStore: ReducerProtocol {

  public init() { }


  public struct State: Equatable {
    var characterRepo: CharactersRepo?
    var errorRepo: ErrorRepo?

    public init() { }

    @BindingState var isShowAlert: Bool = false
  }

  public enum Action: BindableAction, Equatable {
    case binding(BindingAction<MainListStore.State>)
    case getCharacters
    case resultCharacters(Result<CharactersRepo, ErrorRepo>)
    case throwError(ErrorRepo)
  }

  public var body: some ReducerProtocol<State, Action> {
    BindingReducer()

    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .getCharacters:
        return .task {
          await .resultCharacters(RickAndMortyUseCasePlatform().getCharacters())
        }

      case .resultCharacters(let result):
        switch result {
        case .success(let result):
          state.characterRepo = result
          return .none
        case .failure(let error):
          state.errorRepo = error
          return .init(value: .throwError(error))
        }

      case .throwError(_):
        state.isShowAlert = true
        return .none
      }
    }
  }
}
