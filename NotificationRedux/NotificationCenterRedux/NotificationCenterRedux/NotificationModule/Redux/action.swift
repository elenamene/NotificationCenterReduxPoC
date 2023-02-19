enum NotificationCenterAction {
    case getNotifications
    case receivedNotifications(_ notifications: [Notification])
    case receivedError(_ error: NetworkError)
    case markAllNotificationsAsRead
}
