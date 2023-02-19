typealias NotificationStore = Store<NotificationCenterState, NotificationCenterAction>

extension NotificationStore {
    static let previewEnvironment = NotificationStore(
        state: NotificationCenterState(
            notifications: Notification.stubs,
            loadingState: .loaded
        ),
        reducer: notificationCenterReducer,
        middlewares: []
    )
}
