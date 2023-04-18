import Foundation

public struct EpisodesRepo: Codable, Equatable {
  public let info: Info
  public let results: [Episode]

  public struct Info: Codable, Equatable {
      public let count, pages: Int
      public let next: String
      public let prev: String?
  }
}

extension EpisodesRepo {
  public struct Episode: Codable, Equatable {
      public let id: Int
      public let name, airDate, episode: String
      public let characters: [String]
      public let url: String
      public let created: String

      enum CodingKeys: String, CodingKey {
          case id, name
          case airDate = "air_date"
          case episode, characters, url, created
      }
  }
}
