protocol Tracking {
    func track(event: Event)
}

struct Tracker: Tracking {
    func track(event: Event) {
        print("tracked event: \(event.name)")
    }
}

struct Event {
    let name: String
}
