import Foundation
import Domain

public enum MainListModel {
  public struct State: Equatable {
    var characterRepo: CharactersRepo?
    var errorRepo: ErrorRepo?
    var isShowAlert: Bool = false

    public init() { }
  }

  public enum ViewAction: Equatable {
    case getCharacters
  }
}
