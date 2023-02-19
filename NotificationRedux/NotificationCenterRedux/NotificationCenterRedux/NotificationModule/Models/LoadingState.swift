enum LoadingState: Equatable {
    case idle
    case loading
    case loaded
    case error(_ error: NetworkError)
}
