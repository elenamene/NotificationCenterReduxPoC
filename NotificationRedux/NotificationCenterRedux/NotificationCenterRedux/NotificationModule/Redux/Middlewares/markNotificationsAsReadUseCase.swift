func markNotificationsAsReadUseCase(repo: NotificationRepositoring) -> Middleware<NotificationCenterState, NotificationCenterAction> {
    return { state, action in
        let unreadNotifications = state.notifications.filter({ $0.readTime == nil })
        guard !unreadNotifications.isEmpty else { return nil }
        switch action {
        case .markAllNotificationsAsRead:
            do {
                try await repo.markAllAsRead()
                let updated = try await repo.refreshNotifications()
                return .receivedNotifications(updated)
            } catch {
                return .receivedError(.apiError)
            }
        default:
            return nil
        }
    }
}
