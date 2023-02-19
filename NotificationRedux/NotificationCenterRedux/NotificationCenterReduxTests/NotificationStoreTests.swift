import XCTest
@testable import NotificationCenterRedux

final class NotificationStoreTests: XCTestCase {
    private var sut: NotificationStore!
    private var state: NotificationCenterState!
    private var repository: NotificationRepositoryMock!
    private var tracker: TrackerMock!
    
    override func setUp() {
        super.setUp()
        state = NotificationCenterState(
            notifications: [],
            loadingState: .idle
        )
        repository = NotificationRepositoryMock()
        tracker = TrackerMock()
        sut = NotificationStore(
            state: state,
            reducer: notificationCenterReducer,
            middlewares: [
                getNotificationsUseCase(repo: repository),
                markNotificationsAsReadUseCase(repo: repository),
                trackingMiddleware(tracker: tracker)
            ]
        )
    }
    
    func testInitialState() {
        XCTAssertEqual(sut.state.notifications, [])
        XCTAssertEqual(sut.state.loadingState, .idle)
    }
    
    func testMarkAllAsRead() {
        let expectation1 = expectation(description: "should call markAllAsRead")
        let expectation2 = expectation(description: "should call refreshNotifications")
        repository.markAllAsReadStub = { expectation1.fulfill() }
        repository.refreshNotificationsStub = {
            expectation2.fulfill()
            return Notification.stubs
        }
        sut.dispatch(.receivedNotifications(Notification.stubs))
        sut.dispatch(.markAllNotificationsAsRead)
        wait(for: [expectation1, expectation2], timeout: 1, enforceOrder: true)
    }
}
