import ComposableArchitecture
import SwiftUI

@Reducer
struct ExampleReducer {
  @ObservableState
  struct State: Equatable {
    var count: Int = 0
  }

  enum Action {
    case increment
    case decrement
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .increment:
        state.count += 1
        return .none
      
      case .decrement:
        state.count -= 1
        return .none
      }
    }
  }
}

struct ExampleView: View {
  let store: StoreOf<ExampleReducer>

  var body: some View {
    VStack {
      Text(store.count.description)
      Button("Increment") {
        store.send(.increment)
      }
      Button("Decrement") {
        store.send(.decrement)
      }
    }
    .padding()
  }
}

#Preview {
  ExampleView(
    store: Store(
      initialState: ExampleReducer.State()
    ) {
      ExampleReducer()
        ._printChanges()
    }
  )
}
