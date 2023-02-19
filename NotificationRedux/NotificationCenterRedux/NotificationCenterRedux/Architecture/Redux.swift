import Combine

// MARK: Reducer
// - it's the only one that can change the app state through actions
// - it only handles sync work
// - it can receive side effects
// - its only responsibility is to update the app state
// - any other business logic should be encapsulated in a middleware

typealias Reducer<State, Action> = (inout State, Action) -> Void

// MARK: Middlewares
// - they are the only ones that can handle asynchronous work
// - they are a closure that takes a `State` value and an `Action`,
//   do some work with it and returns an optional Effect (Action)
// - there should be no UI logic here, only business logic

typealias Middleware<State, Action> = (State, Action) async -> Action?

// MARK: Store
// - Store the module's state
// - dispatches actions

class Store<State, Action>: ObservableObject {

    // Read-only access to the module's State
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    private let middlewares: [Middleware<State, Action>]
    
    init(
        state: State,
        reducer: @escaping Reducer<State, Action>,
        middlewares: [Middleware<State, Action>] = []
    ) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }

    func dispatch(_ action: Action) {
        reducer(&state, action)
        
        // Dispatch all side effects
        for middleware in middlewares {
            Task {
                if let action = await middleware(state, action) {
                    await MainActor.run {
                        dispatch(action)
                    }
                }
            }
        }
    }
}
