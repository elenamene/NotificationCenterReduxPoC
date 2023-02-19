import Foundation

struct Notification: Identifiable, Equatable {
    let id: Int
    let title: String
    let description: String
    let iconName: String
    let creationTime: Date
    let readTime: Date?
}

extension Array where Element == Notification {
    mutating func markAllAsRead() {
        self = map {
            Notification(
                id: $0.id,
                title: $0.title,
                description: $0.description,
                iconName: $0.iconName,
                creationTime: $0.creationTime,
                readTime: $0.readTime ?? .now
            )
        }
    }
}

extension Notification {
    static let stubs = [
        Notification(
            id: 1,
            title: "Your flight is approved!",
            description: "Great news, [Approver] has approved your flight to [Place]",
            iconName: "airplane",
            creationTime: Calendar.current.date(byAdding: .init(hour: .random(in: -24...0)), to: .now)!,
            readTime: Bool.random() ? .now : nil
        ),
        Notification(
            id: 2,
            title: "Your flight has been canceled",
            description: "Search for an alternative flight to {Place}",
            iconName: "exclamationmark.triangle",
            creationTime: Calendar.current.date(byAdding: .init(hour: .random(in: -24...0)), to: .now)!,
            readTime: Bool.random() ? .now : nil
        ),
        Notification(
            id: 3,
            title: "Flight no longer available",
            description: "Search for an alternative flight to {Place}",
            iconName: "exclamationmark.triangle",
            creationTime: Calendar.current.date(byAdding: .init(hour: .random(in: -24...0)), to: .now)!,
            readTime: Bool.random() ? .now : nil
        ),
        Notification(
            id: 4,
            title: "Trip is awaiting approval",
            description: "Marco’s flight to {Place} is awaiting your approval",
            iconName: "person.fill",
            creationTime: Calendar.current.date(byAdding: .init(hour: .random(in: -24...0)), to: .now)!,
            readTime: Bool.random() ? .now : nil
        )
    ]
}
