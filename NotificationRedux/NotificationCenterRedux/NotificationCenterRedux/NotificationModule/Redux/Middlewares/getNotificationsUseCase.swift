// MARK: Middlewares
// - allows you to intercept every action sent to the reducer
//   so you can make changes to the action or cancel the action.
// - helps you with logging, error reporting, making asynchronous requests...

func getNotificationsUseCase(repo: NotificationRepositoring) -> Middleware<NotificationCenterState, NotificationCenterAction> {
    return { _, action in
        switch action {
        case .getNotifications:
            do {
                let notifications = try await repo.getNotifications()
                let sorted = notifications.sorted(by: { $0.creationTime > $1.creationTime })
                return .receivedNotifications(sorted)
            } catch {
                return .receivedError(.apiError)
            }
        default:
            return nil
        }
    }
}
