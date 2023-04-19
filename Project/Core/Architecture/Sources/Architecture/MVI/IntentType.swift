import Combine
import Foundation

// MARK: - IntentType

protocol IntentType: AnyObject {
  associatedtype ViewAction
  associatedtype State

  var state: State { get set }
  var cancellable: Set<AnyCancellable> { get set }

  func send(action: ViewAction)
  func mutate(action: ViewAction)
}

extension IntentType {

  func send(action: ViewAction) {
    mutate(action: action)
  }
}

// MARK: - IntentBindingType

protocol IntentBindingType {
  associatedtype IntentType
  associatedtype State

  var container: Container<IntentType, State> { get }
  var intent: IntentType { get }
  var state: State { get }
}
