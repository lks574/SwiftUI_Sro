import Foundation

public enum ErrorRepo: Error {
  case requestFailed(String)
  case responseUnsuccessful(String)
  case invalidTypeCasting(String)
  case networkOffline
  case networkUnauthorized
  case networkUnknown
  case networkNotFound
  case other(Error)
  case userCancelled

  // MARK: Public

  public var displayMessage: String {
    switch self {
    case .requestFailed(let description):
      return "Request Failed: \(description)"
    case .responseUnsuccessful(let description):
      return description
    case .invalidTypeCasting(let description):
      return "json invalidTypeCasting \(description)"
    case .networkOffline:
      return "Wifi is offline. please reconnect the wifi."
    case .userCancelled:
      return "User Canceled"
    default:
      return "Sorry Network Error"
    }
  }
}
