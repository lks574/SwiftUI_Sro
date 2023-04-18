import Foundation

public struct CharactersRepo: Codable, Equatable {
    public let info: Info
    public let results: [Character]

    public struct Info: Codable, Equatable {
        public let count, pages: Int
        public let next: String
        public let prev: String?
    }
}

extension CharactersRepo {
  public struct Character: Codable, Equatable {
      public let id: Int
      public let name: String
      public let status: Status
      public let species, type: String
      public let gender: Gender
      public let origin, location: Location
      public let image: String
      public let episode: [String]
      public let url: String
      public let created: String
  }

  public enum Gender: String, Codable, Equatable {
      case female = "Female"
      case male = "Male"
      case unknown = "unknown"
  }

  public struct Location: Codable, Equatable {
      public let name: String
      public let url: String
  }

  public enum Status: String, Codable, Equatable {
      case alive = "Alive"
      case dead = "Dead"
      case unknown = "unknown"
  }
}
