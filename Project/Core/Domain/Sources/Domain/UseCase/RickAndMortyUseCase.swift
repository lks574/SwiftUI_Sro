import Foundation

public protocol RickAndMortyUseCase {
  func getCharacters() async -> Result<CharactersRepo, ErrorRepo>
}
