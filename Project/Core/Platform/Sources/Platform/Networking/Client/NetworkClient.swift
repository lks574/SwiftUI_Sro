import Domain
import Foundation

public enum NetworkClient {

  static func fetch<T: Codable>(method: HttpMethod, path: String, responseModel _: T.Type) async -> Result<T, ErrorRepo> {
    var request: URLRequest = {
      let url = URL(string: path)!
      return URLRequest(url: url)
    }()
    request.httpMethod = method.rawValue
    guard
      let (data, response) = try? await URLSession.shared.data(for: request),
      let httpResponse = response as? HTTPURLResponse
    else {
      return .failure(ErrorRepo.requestFailed("Invalid response"))
    }
    guard httpResponse.statusCode == 200 else {
      return .failure(ErrorRepo.responseUnsuccessful("Status code: \(httpResponse.statusCode)"))
    }

    do {
      let decoder = JSONDecoder()
      return try .success(decoder.decode(T.self, from: data))
    } catch {
      return .failure(ErrorRepo.invalidTypeCasting(error.localizedDescription))
    }
  }
}
