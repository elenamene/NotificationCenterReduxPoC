@testable import NotificationCenterRedux

class TrackerMock: Tracking {
    var trackedEvent: Event?
    
    func track(event: Event) {
        trackedEvent = event
    }
}
