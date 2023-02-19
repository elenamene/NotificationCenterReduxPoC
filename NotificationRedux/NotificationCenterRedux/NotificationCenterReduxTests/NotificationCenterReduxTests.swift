import XCTest
@testable import NotificationCenterRedux

final class NotificationCenterReducerTests: XCTestCase {
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
    }
    
    func testInitialState() {
        XCTAssertEqual(state.loadingState, .idle)
        XCTAssertEqual(state.notifications, [])
    }

    func testAction_getNotifications() {
        notificationCenterReducer(state: &state, action: .getNotifications)
        XCTAssertEqual(state.loadingState, .loading)
    }
    
    func testAction_receivedNotifications() {
        notificationCenterReducer(state: &state, action: .receivedNotifications(Notification.stubs))
        XCTAssertEqual(state.loadingState, .loaded)
        XCTAssertEqual(state.notifications, Notification.stubs)
    }
    
    func testAction_receivedError() {
        notificationCenterReducer(state: &state, action: .receivedError(.apiError))
        XCTAssertEqual(state.loadingState, .error(.apiError))
    }
}
