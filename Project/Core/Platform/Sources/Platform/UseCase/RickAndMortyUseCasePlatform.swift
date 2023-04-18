import Domain
import Foundation

// MARK: - RickAndMortyUseCasePlatform

public struct RickAndMortyUseCasePlatform { }

// MARK: RickAndMortyUseCase

extension RickAndMortyUseCasePlatform: RickAndMortyUseCase {
  public func getCharacters() async -> Result<CharactersRepo, ErrorRepo> {
    await NetworkClient.fetch(method: .get, path: "https://rickandmortyapi.com/api/character", responseModel: CharactersRepo.self)
  }
}
