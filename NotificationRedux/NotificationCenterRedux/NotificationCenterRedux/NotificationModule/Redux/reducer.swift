func notificationCenterReducer(state: inout NotificationCenterState, action: NotificationCenterAction) -> Void {
    switch action {
    case .getNotifications:
        state.loadingState = .loading
    case .receivedNotifications(let notifications):
        state.loadingState = .loaded
        state.notifications = notifications
    case .receivedError(let error):
        state.loadingState = .error(error)
    case .markAllNotificationsAsRead:
        break
    }
}
