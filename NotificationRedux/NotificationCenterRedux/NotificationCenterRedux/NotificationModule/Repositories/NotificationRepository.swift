import Foundation

protocol NotificationRepositoring {
    func getNotifications() async throws ->  [Notification]
    func refreshNotifications() async throws -> [Notification]
    func markAllAsRead() async throws
}

struct NotificationRepository: NotificationRepositoring {
    func getNotifications() async throws ->  [Notification] {
        let succeed = Bool.random()
        try await Task.sleep(for: .seconds(1))
        if succeed {
            return Notification.stubs.shuffled()
        }
        throw NetworkError.apiError
    }
    
    func markAllAsRead() async throws {
        // Pretend to send BE the request
        try await Task.sleep(for: .seconds(1))
    }
    
    func refreshNotifications() async throws -> [Notification] {
        var updated = try await getNotifications()
        // simulate notification successfully updated in BE
        updated.markAllAsRead()
        return updated
    }
}
