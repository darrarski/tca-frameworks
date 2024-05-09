import ComposableArchitecture
import XCTest
@testable import Example

final class ExampleTests: XCTestCase {
  @MainActor
  func testExample() async {
    let store = TestStore(
      initialState: ExampleReducer.State()
    ) {
      ExampleReducer()
    }

    await store.send(.increment) {
      $0.count = 1
    }
    await store.send(.decrement) {
      $0.count = 0
    }
  }
}
