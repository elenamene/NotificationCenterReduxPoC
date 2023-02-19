@testable import NotificationCenterRedux

class NotificationRepositoryMock: NotificationRepositoring {
    var getNotificationsStub: (() -> [Notification])?
    var refreshNotificationsStub: (() -> [Notification])?
    var markAllAsReadStub: (() -> Void)?
    
    func getNotifications() async throws -> [Notification] {
        getNotificationsStub?() ?? []
    }
    
    func refreshNotifications() async throws -> [Notification] {
        refreshNotificationsStub?() ?? []
    }
    
    func markAllAsRead() async throws {
        markAllAsReadStub?()
    }
}
