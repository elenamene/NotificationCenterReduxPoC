func trackingMiddleware(tracker: Tracking) -> Middleware<NotificationCenterState, NotificationCenterAction> {
    return { _, action in
        switch action {
        case .receivedError:
            let event = Event(name: "Received error on fetching")
            tracker.track(event: event)
        case.receivedNotifications:
            let event = Event(name: "Received error notifications")
            tracker.track(event: event)
        case .markAllNotificationsAsRead:
            let event = Event(name: "Marked all as read")
            tracker.track(event: event)
        case .getNotifications:
            break
        }
        return nil
    }
}
