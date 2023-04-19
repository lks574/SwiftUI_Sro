import SwiftUI
import Domain

public struct CharacterItem {
  public let viewState: ViewState

}

extension CharacterItem {
  public struct ViewState: Equatable, Identifiable {
    public var id: Int { item.id }
    let item: CharactersRepo.Character
  }
}

extension CharacterItem: View {
  public var body: some View {
    HStack(spacing: .zero) {
      AsyncImage(url: URL(string: viewState.item.image)) {
        $0.image?.resizable()
      }
      .frame(width: 100, height: 100)
      .clipped()
      
      VStack(alignment: .leading, spacing: 8) {
        VStack(alignment: .leading, spacing: 4) {
          Text("name: \(viewState.item.name)")
            .font(.system(size: 16))
          Text("status: \(viewState.item.status.rawValue)")
        }

        VStack(alignment: .leading, spacing: 4) {
          Text("gender: \(viewState.item.gender.rawValue)")
          Text("location: \(viewState.item.location.name)")
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .background(Color.gray)
  }
}
