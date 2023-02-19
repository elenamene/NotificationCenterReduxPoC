// MARK: - Top level State
// - Unique source of truth for the module
// - Holds state for all internal features

struct NotificationCenterState {
    var notifications = [Notification]()
    var loadingState = LoadingState.idle
}
